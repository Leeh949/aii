# import sys
# sys.path.append(r'C:\aii\source\pylib')
# from sample_pac.ab import a
# python -m sample_pac.cd.c 

from ..ab import a


def nice():
    print("sample_pac/cd안에 c모듈안에 nice")
    a.hello()

if __name__ == '__main__':
    nice()