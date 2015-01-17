#!/usr/bin/env python

import glob, os, itertools

libs = map(lambda lib: (os.path.basename(lib), lib), glob.glob('./build/Products/Release-iphone*/libPods*.a'))
first = lambda iterable: iterable[0]
last = lambda iterable: iterable[1]

for key, group in itertools.groupby(sorted(libs, key=first), first):
    target = 'build/%s' % key
    cmd = 'lipo -create -output %s %s' % (target, ' '.join(map(last, group)))
    print 'Run: %s' % cmd
    if os.system(cmd): raise Exception('Command failed: %s' % cmd)

print '\nAll fat libs are created successfully!'
