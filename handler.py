#!/usr/bin/env python3.7

# Copyright 2022, Gurobi Optimization, LLC

# This example reads an LP model from a file and solves it.
# If the model is infeasible or unbounded, the example turns off
# presolve and solves the model again. If the model is infeasible,
# the example computes an Irreducible Inconsistent Subsystem (IIS),
# and writes it to a file

# ipython3 lp.py examples/1.lp
# https://www.gurobi.com/documentation/10.0/examples/lp_py.html

from gurobipy import GRB
from info import info
import gurobipy
import sys
import tempfile

# https://www.gurobi.com/documentation/10.0/refman/optimization_status_codes.html
gurobipy_status_explanations = {
  1: "LOADED: Model is loaded, but no solution information is available.",
  2: "OPTIMAL: Model was solved to optimality (subject to tolerances), and an optimal solution is available.",
  3: "INFEASIBLE: Model was proven to be infeasible.",
  4: "INF_OR_UNBD: Model was proven to be either infeasible or unbounded. To obtain a more definitive conclusion, set the DualReductions parameter to 0 and reoptimize.",
  5: "UNBOUNDED: Model was proven to be unbounded. Important note: an unbounded status indicates the presence of an unbounded ray that allows the objective to improve without limit. It says nothing about whether the model has a feasible solution. If you require information on feasibility, you should set the objective to zero and reoptimize.",
  6: "CUTOFF: Optimal objective for model was proven to be worse than the value specified in the Cutoff parameter. No solution information is available.",
  7: "ITERATION_LIMIT: Optimization terminated because the total number of simplex iterations performed exceeded the value specified in the IterationLimit parameter, or because the total number of barrier iterations exceeded the value specified in the BarIterLimit parameter.",
  8: "NODE_LIMIT: Optimization terminated because the total number of branch-and-cut nodes explored exceeded the value specified in the NodeLimit parameter.",
  9: "TIME_LIMIT: Optimization terminated because the time expended exceeded the value specified in the TimeLimit parameter.",
  10: "SOLUTION_LIMIT: Optimization terminated because the number of solutions found reached the value specified in the SolutionLimit parameter.",
  11: "INTERRUPTED: Optimization was terminated by the user.",
  12: "NUMERIC: Optimization was terminated due to unrecoverable numerical difficulties.",
  13: "SUBOPTIMAL: Unable to satisfy optimality tolerances; a sub-optimal solution is available.",
  14: "INPROGRESS: An asynchronous optimization call was made, but the associated optimization run is not yet complete.",
  15: "USER_OBJ_LIMIT: User specified an objective limit (a bound on either the best objective or the best bound), and that limit has been reached.",
  16: "WORK_LIMIT: Optimization terminated because the work expended exceeded the value specified in the WorkLimit parameter.",
  17: "MEM_LIMIT: Optimization terminated because the total amount of allocated memory exceeded the value specified in the SoftMemLimit parameter.",
}


def handle(request, repo_path):

  # Read and solve model
  with tempfile.NamedTemporaryFile(suffix='.lp') as tmp:

    # request.data is the <class 'bytes'> body of the HTTP request.
    tmp.write(request.data)

    # Or else the content under `tmp.name` will have zero length.
    tmp.flush()

    # tmp.name is the path to a file under /tmp/
    try:
      model = gurobipy.read(tmp.name)
    except gurobipy.GurobiError as e:
      error_info = f'args: {e.args}\nerrno: {e.errno}\nmessage: {e.message}\nwith_traceback(): {e.with_traceback()}\n'
      return error_info

  model.optimize()
  if model.Status == GRB.INF_OR_UNBD:
    # Turn presolve off to determine whether model is infeasible
    # or unbounded
    model.setParam(GRB.Param.Presolve, 0)
    model.optimize()

  if model.Status == GRB.OPTIMAL:
    with tempfile.NamedTemporaryFile(suffix='.sol') as tmp:
      model.write(tmp.name)
      solution = tmp.read()
    return solution

  if model.Status == GRB.INFEASIBLE:
    # Model is infeasible - compute an Irreducible Inconsistent Subsystem (IIS)
    model.computeIIS()
    with tempfile.NamedTemporaryFile(suffix='.ilp') as tmp:
      model.write(tmp.name)
      irreducible_inconsistent_subsystem = tmp.read()
    return f'Problem is infeasible. Here\'s an Irreducible Inconsistent Subsystem:\n\n{irreducible_inconsistent_subsystem.decode()}'

  return f'Optimization was stopped.\n\n{gurobipy_status_explanations[model.Status]}'
