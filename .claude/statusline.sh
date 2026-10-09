#!/usr/bin/env bash
# Claude Code status line: model │ context window │ 5h limit │ 7d limit.
# Reads the session JSON that Claude Code pipes on stdin; segments with no data are hidden.

IFS=$'\x1f' read -r model ctx five five_reset seven seven_reset < <(
  jq -r '
    def pct: if type == "number" then round else "-" end;
    def epoch: if type == "number" then floor else "-" end;
    [
      .model.display_name // "Claude",
      (.context_window.used_percentage | pct),
      (.rate_limits.five_hour.used_percentage | pct),
      (.rate_limits.five_hour.resets_at | epoch),
      (.rate_limits.seven_day.used_percentage | pct),
      (.rate_limits.seven_day.resets_at | epoch)
    ] | map(tostring) | join("\u001f")'
)

rgb() { printf '\033[38;2;%d;%d;%dm' "$1" "$2" "$3"; }
GREEN=$(rgb 51 221 45)  # #33DD2D, matches the oh-my-posh theme
YELLOW=$(rgb 245 200 66)
RED=$(rgb 241 24 76)    # #f1184c
TEXT=$(rgb 223 254 238) # #dffeee
DIM=$(rgb 110 118 129)
RESET=$'\033[0m'
now=$(date +%s)

repeat() {
  local s= i
  for ((i = 0; i < $2; i++)); do s+=$1; done
  printf '%s' "$s"
}

# meter <pct> [bar_width]: colored bar (optional) followed by the percentage.
meter() {
  local pct=$1 width=${2:-0} color=$GREEN filled
  ((pct >= 50)) && color=$YELLOW
  ((pct >= 80)) && color=$RED
  if ((width > 0)); then
    filled=$(((pct * width + 50) / 100))
    ((filled > width)) && filled=$width
    printf '%s%s%s%s ' "$color" "$(repeat ▰ "$filled")" "$DIM" "$(repeat ▱ $((width - filled)))"
  fi
  printf '%s%d%%%s' "$color" "$pct" "$RESET"
}

# countdown <epoch>: time left until a limit resets, e.g. 3d4h, 1h12m, 8m.
countdown() {
  local secs=$(($1 - now))
  ((secs > 0)) || return
  local d=$((secs / 86400)) h=$((secs % 86400 / 3600)) m=$((secs % 3600 / 60))
  if ((d > 0)); then
    printf '%dd%dh' "$d" "$h"
  elif ((h > 0)); then
    printf '%dh%dm' "$h" "$m"
  else
    printf '%dm' "$m"
  fi
}

# limit <label> <pct> <resets_at> [bar_width]
limit() {
  [[ $2 == - ]] && return
  local out left
  out="${DIM}$1${RESET} $(meter "$2" "$4")"
  [[ $3 != - ]] && left=$(countdown "$3")
  [[ -n $left ]] && out+=" ${DIM}⟳${left}${RESET}"
  printf '%s' "$out"
}

segments=("${TEXT}✻ ${model}${RESET}")
[[ $ctx != - ]] && segments+=("${DIM}ctx${RESET} $(meter "$ctx" 8)")
seg=$(limit 5h "$five" "$five_reset" 5) && [[ -n $seg ]] && segments+=("$seg")
seg=$(limit 7d "$seven" "$seven_reset") && [[ -n $seg ]] && segments+=("$seg")

out=${segments[0]}
for seg in "${segments[@]:1}"; do out+=" ${DIM}│${RESET} $seg"; done
printf '%s\n' "$out"
