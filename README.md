# ctc-patches
Patches for the CTC to compile boost libraries with QI-Build.

**Note: ** without these patches you will be able to compile for the dev environment, but the cross-compiler will fail.

1. To install these patches, replace the cmake folder in `/home/vagrant/NAO/devtools/ctc-linux64-atom-2.1.4.13/boost/share` 
with the cloned folder.

2. Next, in the file `/home/vagrant/NAO/devtools/ctc-linux64-atom-2.1.4.13/boost/include/boost-1_55/boost/noncopyable.hpp` replace the lines

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

3. Next to fix a bug in boost::asio that was in versions of boost < 1.58, in the file `/home/vagrant/NAO/devtools/ctc-linux64-atom-2.1.4.13/boost/include/boost-1_55/boost/asio/detail/config.hpp` replace the lines

```c++
// Standard library support for addressof.
#if !defined(BOOST_ASIO_HAS_STD_ADDRESSOF)
# if !defined(BOOST_ASIO_DISABLE_STD_ADDRESSOF)
#  if defined(BOOST_ASIO_HAS_CLANG_LIBCXX)
#   define BOOST_ASIO_HAS_STD_ADDRESSOF 1
#  endif // defined(BOOST_ASIO_HAS_CLANG_LIBCXX)
#  if defined(__GNUC__)
#   if ((__GNUC__ == 4) && (__GNUC_MINOR__ >= 5)) || (__GNUC__ > 4)
#    if defined(__GXX_EXPERIMENTAL_CXX0X__)
#     define BOOST_ASIO_HAS_STD_ADDRESSOF 1
#    endif // defined(__GXX_EXPERIMENTAL_CXX0X__)
#   endif // ((__GNUC__ == 4) && (__GNUC_MINOR__ >= 5)) || (__GNUC__ > 4)
#  endif // defined(__GNUC__)
#  if defined(BOOST_ASIO_MSVC)
#   if (_MSC_VER >= 1700)
#    define BOOST_ASIO_HAS_STD_ADDRESSOF 1
#   endif // (_MSC_VER >= 1700)
#  endif // defined(BOOST_ASIO_MSVC)
# endif // !defined(BOOST_ASIO_DISABLE_STD_ADDRESSOF)
#endif // !defined(BOOST_ASIO_HAS_STD_ADDRESSOF)
```

with the following:

```c++
// Standard library support for addressof.
#if !defined(BOOST_ASIO_HAS_STD_ADDRESSOF)
# if !defined(BOOST_ASIO_DISABLE_STD_ADDRESSOF)
#  if defined(__clang__)
#   if defined(BOOST_ASIO_HAS_CLANG_LIBCXX)
#    define BOOST_ASIO_HAS_STD_ADDRESSOF 1
#   elif (__cplusplus >= 201103)
#    define BOOST_ASIO_HAS_STD_ADDRESSOF 1
#   endif // (__cplusplus >= 201103)
#  endif // defined(__clang__)
#  if defined(__GNUC__)
#   if ((__GNUC__ == 4) && (__GNUC_MINOR__ >= 6)) || (__GNUC__ > 4)
#    if defined(__GXX_EXPERIMENTAL_CXX0X__)
#     define BOOST_ASIO_HAS_STD_ADDRESSOF 1
#    endif // defined(__GXX_EXPERIMENTAL_CXX0X__)
#   endif // ((__GNUC__ == 4) && (__GNUC_MINOR__ >= 6)) || (__GNUC__ > 4)
#  endif // defined(__GNUC__)
#  if defined(BOOST_ASIO_MSVC)
#   if (_MSC_VER >= 1700)
#    define BOOST_ASIO_HAS_STD_ADDRESSOF 1
#   endif // (_MSC_VER >= 1700)
#  endif // defined(BOOST_ASIO_MSVC)
# endif // !defined(BOOST_ASIO_DISABLE_STD_ADDRESSOF)
#endif // !defined(BOOST_ASIO_HAS_STD_ADDRESSOF)
```
