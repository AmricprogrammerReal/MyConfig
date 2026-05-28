#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Modern 2-Line Bash Prompt
_update_prompt() {
    # Safely extract git branch
    local branch
    branch=$(git branch --show-current 2>/dev/null)

    # Modern 256-Color Palette (No ugly background blocks)
    local c_user='\[\e[1;38;5;114m\]'   # Soft pastel green
    local c_host='\[\e[1;38;5;245m\]'   # Muted clean gray
    local c_path='\[\e[1;38;5;39m\]'    # Vibrant electric blue
    local c_git='\[\e[1;38;5;214m\]'    # Warm orange/amber
    local c_arrow='\[\e[1;38;5;220m\]'  # Bright yellow
    local c_reset='\[\e[0m\]'

    # Dynamically build git info so empty () don't show up
    local git_info=""
    if [[ -n "$branch" ]]; then
        git_info=" ${c_host}(${c_git}${branch}${c_host})"
    fi

    # Assemble 2-line prompt
    PS1="${c_user}\u${c_host}@\h ${c_path}\w${git_info}\n${c_arrow}❯${c_reset} "
}
PROMPT_COMMAND=_update_prompt
# --- Environment Variables ---
export EDITOR='vim'
export VISUAL='vim'
export TERMINAL='alacritty'
#Custom
alias freeup="sudo sh -c 'sync && echo 3 > /proc/sys/vm/drop_caches' "
alias bashclear="cat /dev/null > ~/.bash_history && history -c && exit
"
alias v-in='sudo xbps-install -S'
alias v-up='sudo xbps-install -Su'
alias v-rm='sudo xbps-remove -R'
alias v-cl='sudo xbps-remove -O'
alias v-se='xbps-query -Rs'
alias v-q='xbps-query -W'

