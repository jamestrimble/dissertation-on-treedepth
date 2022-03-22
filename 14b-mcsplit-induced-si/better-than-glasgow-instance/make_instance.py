import sys

a = int(sys.argv[1])
b = int(sys.argv[2])

with open('P.lad', 'w') as f:
    f.write('{}\n'.format(a + b + 1))
    f.write('{} {}\n'.format(a, ' '.join(str(v) for v in range(1, a + 1))))
    for i in range(a + b):
        f.write('0\n')

with open('T.lad', 'w') as f:
    f.write('{}\n'.format(a + b + 2))
    f.write('{} {}\n'.format(a + 2, ' '.join(str(v) for v in range(1, a + 3))))
    for i in range(a + b + 1):
        f.write('0\n')
