" Vim syntax file
" file type: log files
" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
finish
endif
syn match fatal ".* FATAL .*"
syn match fatal "^FATAL: .*"
syn match error ".* ERROR .*"
syn match error "^ERROR: .*"
syn match warn ".* WARN .*"
syn match warn "^WARN: .*"
syn match info ".* INFO .*"
syn match info "^INFO: .*"
syn match debug ".* DEBUG .*"
syn match debug "^DEBUG: .*"

syn match error "^java.*Exception.*"
syn match error "^java.*Error.*"
syn match error "^\tat .*"

" Highlight colors for log levels.
hi fatal ctermfg=Red ctermbg=Black
hi error ctermfg=Red ctermbg=Black
hi warn ctermfg=Yellow ctermbg=Black
hi info ctermfg=Green ctermbg=Black
hi debug ctermfg=Gray ctermbg=Black

let b:current_syntax = "log"
