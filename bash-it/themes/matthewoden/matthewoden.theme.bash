#!/usr/bin/env bash
# Based off envy theme. Presumes Dracula Color scheme as well.

SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" |"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_CLEAN=" ${bold_green}✔"
GIT_THEME_PROMPT_DIRTY=" ${bold_red}✗"
GIT_THEME_PROMPT_PREFIX="${bold_cyan} |"
GIT_THEME_PROMPT_SUFFIX="${bold_cyan}|${reset_color}"

function prompt_command() {
    PS1="\n${purple}\h ${reset_color}in ${green}\w\n${bold_cyan}$(scm_char)${green}$(scm_prompt_info) ${green}→${reset_color} "
}

safe_append_prompt_command prompt_command
