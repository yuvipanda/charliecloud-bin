import os
import subprocess
from glob import glob
from setuptools import setup, find_packages
from wheel.bdist_wheel import bdist_wheel
from wheel.pep425tags import get_platform

here = os.path.dirname(__file__)
source = os.path.join(here, 'charliecloud')

subprocess.check_call(['make'], cwd=source)

included_files = [
    f for f in glob(os.path.join(source, 'bin', '*'))
    if os.access(f, os.X_OK) or f.endswith('.sh')
]

with open(os.path.join(source, 'VERSION')) as f:
    version = f.read().strip() + 'alpha1'

setup(
    name='charliecloud-bin',
    description="Binary packages of charliecloud",
    version=version,
    include_package_data=True,
    data_files=[('bin', included_files)],
)