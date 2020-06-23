# Aquatic C++ Coding Exercise

## Project

We need to track a large number of items for insertion via a key. We want the performance to be good, but we also want to minimize the performance variance so as to have a more stable performance metric to plan on. Currently, we use a traditional hash map for the task, and we’ve found that it is both too high on latency and has too high of a variance, when profiled. An internal developer has mentioned the concept of an Open Addressing Hash-Table, and we’d like to implement one so that we might compare its performance characteristics.

An open-addressing hash-table has an overly sized internal array, same as a traditional collision-list based hash-table, but instead of using the hash to find a collision list and then inserting the element in such a list, the item goes directly into the hashed location within the internal array. If an element is already there, we will place the new element in the first free location, by stepping incrementally from the hash location. As such, "collision lists" exist as consecutively filled elements in the internal array.

Your task is to create an open-addressing hash-table with at least the following:

* Default construction
* Insertion of elements via a key
* Retrieval of elements based on the key
* Reporting current size of the container

Notes:

* Repeated insertions for the same key should overwrite each other.
* The container should provide storage to some factor of what the machine will reasonably allow. (No predefined maximum number of items)
* We do not expect you to fully imeplement STL compatibility in this task, and would instead ask you to approach this problem in the manner in which you would expect to do so if given such a task.
* While templates are permissible, the intent of this exercise is to gauge your comfort in C++ programming while respecting your time. If template programming is not your forte, then feel free to just have the facility store ints, or strings, or whatever other basic type you feel appropriate, for now.
* At this time, we will leave removal of items as a future extension
* There is no explicit need for iterator support, though you are welcome to do so, if you feel it best for your implementation.

## Getting started

First, make sure to pull this code base to your local system:

```
git clone https://github.com/aquanauts/cpp_interview.git
cd cpp_interview
```

## Provided

Notice: While Aquatic deals with social distancing, we are performing virtual interviews. As such, the need for a standardized build environment (below) is largely mitigated by your interview being done primarily through screen share of your setup, rather than on an Aquatic machine at our office. As such, free to use the build environment provided, below. If that proves troublesome, such as trying to develop on a Mac or recent version of Fedora that requires podman, then the please feel free to develop in whatever environment you have available to you, so long as you will be able to share your screen in a virtual interview.

Lacking any standard build environment, we provide a docker-based setup to get you going. The expectation is that the code provided would be able to build within this environment, but you are free to develop in whatever environment makes you comfortable.

The environment provides:

* centos 7
* gcc 10.1.0, built from source and installed in `/opt/gcc`
* gtest-devel installed via yum
* boost-devel installed via yum
* cmake3 (symbolycally linked as `/usr/bin/cmake` for convenience)
* removes default compilers to avoid confusion

To pull the pre-built docker image, please see: https://hub.docker.com/repository/docker/rwdougla/aq_cpp

OR

To build docker image from source

`docker build . -t rwdougla/aq_cpp`

Run docker: (Take care to personalize to where you pulled this repo)

``docker run --rm -it -v `pwd`:/workspace/ rwdougla/aq_cpp bash``

Inside Docker container:

```
cd /workspace/
mkdir debug && cd debug
cmake ..
make
./tests/tests
```
