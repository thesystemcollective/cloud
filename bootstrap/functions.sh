function file_exists {
  if [ -f "$1" ]; then
    echo "$1 exists."
  else 
    echo "$1 does not exist."
    exit 1
  fi
}

function var_exists {
  if [ -z "$1" ]
  then
    echo "$2 is empty"
    exit 1
  fi
}
