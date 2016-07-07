# ctc-patches
Patches for the CTC to compile boost libraries with QI-Build

To install these patches, replace the cmake folder in `/home/vagrant/NAO/devtools/ctc-linux64-atom-2.1.4.13/boost/share` 
with the cloned folder.

Next, in the file `/home/vagrant/NAO/devtools/ctc-linux64-atom-2.1.4.13/boost/include/boost-1_55/boost/noncopyable.hpp` replace the lines

```
#ifndef BOOST_NO_DEFAULTED_FUNCTIONS
    BOOST_CONSTEXPR noncopyable() = default;
    ~noncopyable() = default;
#else
```

with the phrase
```
#if !defined(BOOST_NO_DEFAULTED_FUNCTIONS) && !defined(BOOST_NO_CXX11_NON_PUBLIC_DEFAULTED_FUNCTIONS) 
    BOOST_CONSTEXPR noncopyable() = default; 
    ~noncopyable() = default; 
#else
```


