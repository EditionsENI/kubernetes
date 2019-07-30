# Change colors using current context
function change_color() {
  RETVAL=$?
  context=$(command kubectl config current-context 2>/dev/null)
  if [ -z "$context" ] || [ "$context" = "minikube" ]; then
    command konsoleprofile colors=Breeze
  else
    command konsoleprofile colors=RedOnBlack
  fi
  return $RETVAL

}
