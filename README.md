This project is a fork of https://github.com/chainguard-dev/jvm-performance-benchmarks.
The original readme is in the [README_ORIGINAL.md](README_ORIGINAL.md) file.

The fork features different artifact group, versioning system and some scripts to run the benchmarks.
Refer to git history for the list of changes.

## Versioning
Versions is in a [major].[minor] format, where [major] changes only with breaking changes to the benchmarks themselves.
Running this tool with different [minor] versions should bring no difference in the benchmark results.

## Java runner
Benchmark suite can be run using a Java-based runner, simply by executing `java -jar benchmarks.jar` command.
Running it without any args will print help message. The results json from `run` command will land in `/tmp/results.json`
file sa different jdk images may have different write permissions and `/tmp` should always be available.

Merge results from multiple runs with a simple
```shell
cat [result files] | jq  '.[]' | jq -s > merged_results_file.json
```

## Benchmarks for specific JDK versions
The maven build process determines which benchmarks are going to land in the resulting jar.
The profiles "jdk[version]_profile" are used to exclude classes that should no tbe run.
The java-based benchmark runner will find all benchmarks available in the classpath, so no configuration is needed at runtime.
At this point profiles for versions 11, 17 and 21 are present.
