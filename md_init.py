import ase, ase.build
atoms = ase.build.bulk("Ar", "fcc", a=5.256, cubic=True)*(25,25,25)
ase.io.write("initial.traj", atoms)
