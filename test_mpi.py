#!/usr/bin/env python3

from mpi4py import MPI

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()

if rank == 0:
  print("We have" , size, "processes.")
  for i in range(1, size):
    comm.send("Hello "+str(i)+"!", dest=i, tag=i)

  for i in range(1, size):
    msg = comm.recv(source=i, tag=0)
    print(msg)
else:
  data = comm.recv(source=0, tag=rank)
  msg = "Hello from " +str(rank)+"."
  comm.send(msg, dest=0, tag=0)

comm.Barrier()
