#!/bin/bash

if [ "$SKIP_PROPERTIES_BUILDER" = true ]; then
  echo "Skipping properties builder"
  echo "`cat $PROP_FILE`"
  exit 0
fi

cat > $PROP_FILE <<EOF
dbname=${MONGODB_DATABASE:-dashboarddb}
dbhost=${MONGODB_HOST:-db}
dbport=${MONGODB_PORT:-27017}
dbusername=${MONGODB_USERNAME:-dashboarduser}
dbpassword=${MONGODB_PASSWORD:-dbpassword}

sonar.cron=${SONAR_CRON:-0 */5 * * * *}

sonar.servers[0]=${SONAR_URL:-http://localhost:9000}

sonar.username=$SONAR_USERNAME
sonar.password=$SONAR_PASSWORD

#Sonar Metrics
sonar.metrics[0]=${SONAR_METRICS:-ncloc,violations,blocker_violations,critical_violations,major_violations,tests,test_success_density,test_errors,test_failures,coverage,line_coverage,sqale_index,alert_status,quality_gate_details,security_rating}

#Sonar Version - see above for semantics between version/metrics
sonar.versions[0]=${SONAR_VERSION}

EOF

echo "

===========================================
Properties file created `date`:  $PROP_FILE
Note: passwords hidden
===========================================
`cat $PROP_FILE |egrep -vi password`
"

exit 0
