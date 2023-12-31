# Copyright 2023 Tony Prindel

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/bin/bash

sudo apk add --no-cache --update openjdk${JAVA_VERSION}

cd /server/
java ${JAVA_ARGS} -jar ${JAR_NAME}

# Automatically restart if we had an unexpected stop and AUTO_RESTART hasn't been disabled.
while [ "$?" -ne 0 ] && [ "$AUTO_RESTART" = "true" ]
do
java ${JAVA_ARGS} -jar ${JAR_NAME}
done
