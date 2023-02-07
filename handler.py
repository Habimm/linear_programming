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

def handle(request, repo_path):
  # Read and solve model

  with tempfile.NamedTemporaryFile(suffix='.lp') as tmp:
    # request.data is the <class 'bytes'> body of the HTTP request.
    tmp.write(request.data)

    # Or else the content under `tmp.name` will have zero length.
    tmp.flush()
    # tmp.name is the path to a file under /tmp/
    info(tmp.name)
    model = gurobipy.read(tmp.name)
    info(model)
    info(model.display())

  model.optimize()
  if model.Status == GRB.INF_OR_UNBD:
    # Turn presolve off to determine whether model is infeasible
    # or unbounded
    model.setParam(GRB.Param.Presolve, 0)
    model.optimize()

  if model.Status == GRB.OPTIMAL:
    print('Optimal objective: %g' % model.ObjVal)

    with tempfile.NamedTemporaryFile(suffix='.sol') as tmp:
      model.write(tmp.name)
      # tmp.flush()
      info(tmp.name)
      solution = tmp.read()
      info(solution)
      # breakpoint()
    return solution

  elif model.Status != GRB.INFEASIBLE:
    print('Optimization was stopped with status %d' % model.Status)
    return 'Hello'


  # Model is infeasible - compute an Irreducible Inconsistent Subsystem (IIS)

  print('')
  print('Model is infeasible')
  model.computeIIS()
  model.write("model.ilp")
  print("IIS written to file 'model.ilp'")
