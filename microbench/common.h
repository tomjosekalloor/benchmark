#ifndef COMMON_H
#define COMMON_H

#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define MEGABYTE 1048576L

#define BILLION 1000000000L


/**
 *  Gets the time in seconds given a struct timespec
 *
 * @return  double of the time in seconds of the arg
 */
static __attribute__((always_inline)) inline double  time_seconds(struct timespec time)
{
    return (double)time.tv_sec + (double)time.tv_nsec / (double)BILLION;
}

/**
 * Returns the difference of two struct timespec args
 *
 * @param old old time
 * @param new new time
 *
 * @return  new - old returned as a struct timespec
 */
static inline struct timespec diff_time(struct timespec old, struct timespec new)
{
    if (new.tv_nsec < old.tv_nsec)
        return (struct timespec)
    {
        .tv_sec = new.tv_sec - 1 - old.tv_sec,
        .tv_nsec = BILLION + new.tv_nsec - old.tv_nsec
    };
    else
        return (struct timespec)
    {
        .tv_sec = new.tv_sec - old.tv_sec,
        .tv_nsec = new.tv_nsec - old.tv_nsec
    };
}

#define ROI_BEGIN() \
    struct timespec time0, time1; \
    clock_gettime(CLOCK_MONOTONIC_RAW, &time0);

#define ROI_END() \
    clock_gettime(CLOCK_MONOTONIC_RAW, &time1); \
    struct timespec difference = diff_time(time0,time1); \
    printf("Loop Seconds: %8.9f\n",time_seconds(difference));

#endif //define COMMON_H
