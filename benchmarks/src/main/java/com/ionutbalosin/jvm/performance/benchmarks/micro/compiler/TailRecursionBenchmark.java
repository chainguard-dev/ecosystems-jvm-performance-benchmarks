/**
 *  JVM Performance Benchmarks
 *
 *  Copyright (C) 2019 - 2022 Ionut Balosin
 *  Website: www.ionutbalosin.com
 *  Twitter: @ionutbalosin
 *
 *  Co-author: Florin Blanaru
 *  Twitter: @gigiblender
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
package com.ionutbalosin.jvm.performance.benchmarks.micro.compiler;

import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.BenchmarkMode;
import org.openjdk.jmh.annotations.Fork;
import org.openjdk.jmh.annotations.Measurement;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.annotations.OutputTimeUnit;
import org.openjdk.jmh.annotations.Param;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.Setup;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.annotations.Warmup;

/*
 * A tail-recursive function is a function where the last operation before the function returns is an invocation to the function itself.
 * Tail-recursive optimization avoids allocating a new stack frame by re-writing the method into a completely iterative fashion.
 */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.MICROSECONDS)
@Warmup(iterations = 5, time = 10, timeUnit = TimeUnit.SECONDS)
@Measurement(iterations = 5, time = 10, timeUnit = TimeUnit.SECONDS)
@Fork(
    value = 5,
    jvmArgsAppend = {"-Xss64M"})
@State(Scope.Benchmark)
public class TailRecursionBenchmark {

  // $ java -jar */*/benchmarks.jar ".*TailRecursionBenchmark.*"

  @Param({"262144"})
  int n;

  private final int size = 1024;

  private int[] A;

  @Setup
  public void setup() {
    A = new int[size];
    for (int i = 0; i < size; i++) {
      A[i] = i;
    }
  }

  @Benchmark
  public long tail_recursive() {
    return recursive(n, 0);
  }

  @Benchmark
  public long iterative() {
    return iterative(n, 0);
  }

  private long recursive(int n, long sum) {
    if (n == 0) {
      return sum;
    } else {
      return recursive(n - 1, sum + A[n % size]);
    }
  }

  private long iterative(int n, long sum) {
    while (true) {
      if (n == 0) {
        return sum;
      } else {
        sum += A[n % size];
        n--;
      }
    }
  }
}
