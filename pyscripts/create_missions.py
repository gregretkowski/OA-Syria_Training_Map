import argparse
import logging

from mizlib import Mizlib

parser = argparse.ArgumentParser()
parser.add_argument('filename')
parser.add_argument('release')
parser.add_argument('--debug', '-d', action='store_true', help='Enable debug logging')


args = parser.parse_args()

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)
if args.debug:
    logger.setLevel(logging.DEBUG)

miz = Mizlib(args.filename,args.release,logger)

miz.doit()
