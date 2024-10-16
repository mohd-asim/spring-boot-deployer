#!/bin/sh
# ----------------------------------------------------------------------------
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------

MVN="$MAVEN_HOME/bin/mvn"
if [ -x "$MVN" ]
then
  exec "$MVN" "$@"
  exit "$?"
fi

unset MVN

# To avoid issues with paths containing spaces, we use shift and quote the parameter
while [ $# -gt 0 ]
do
  case $1 in
    -D*=*) KEY="${1%%=*}"; shift; set -- "$@" "$KEY" "${1#*=}" ;;
    --*=*) KEY="${1%%=*}"; shift; set -- "$@" "$KEY" "${1#*=}" ;;
    *) shift; set -- "$@" "$1" ;;
  esac
  shift

done

exec java -jar "$MAVEN_OPTS" -Dmaven.multiModuleProjectDirectory="$MAVEN_PROJECTBASEDIR" -Dmaven.home="${M2_HOME:-$HOME/.m2}" -cp .mvn/wrapper/maven-wrapper.jar org.apache.maven.wrapper.MavenWrapperMain "$@"
