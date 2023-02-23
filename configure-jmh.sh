#!/bin/bash
#
#  JVM Performance Benchmarks
#
#  Copyright (C) 2019 - 2022 Ionut Balosin
#  Website: www.ionutbalosin.com
#  Twitter: @ionutbalosin
#
#  Co-author: Florin Blanaru
#  Twitter: @gigiblender
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

export JMH_JAR="benchmarks/target/benchmarks.jar"
export JMH_BENCHMARKS="benchmarks-suite-jdk${JDK_VERSION}.json"
export JMH_OUTPUT_FOLDER="results/jdk-$JDK_VERSION/$ARCH/$JVM_IDENTIFIER"

echo "JMH jar: $JMH_JAR"
echo "JMH benchmarks suite configuration file: $JMH_BENCHMARKS"
echo "JMH output folder: $JMH_OUTPUT_FOLDER"
echo ""

read -r -p "If the above configuration is correct, press ENTER to continue or CRTL+C to abort ... "
