# DerelictJWT
**UNOFFICAL** Derelict binding to the libjwt library (https://github.com/benmcollins/libjwt)

This library is provided under the MIT license, but you still must comply with the terms of the LGPL-2.1 License which
it is released under.

You can find information on how Derelict and shared libraries work [here](https://derelictorg.github.io/compiling.html) and [here.](http://derelictorg.github.io/using.html)

More information on how to use DerelictJWT can be found on the [WIKI.](https://github.com/jython234/DerelictJWT/wiki)

*Sample Code:*
```D
import derelict.jwt.jwt;

void main() {
    DerelictJWT.load(); // Load the shared library
    // Now you can call libjwt methods
}
```
