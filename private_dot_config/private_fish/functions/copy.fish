function copy --wraps='kitty +kitten clipboard' --description 'alias copy=kitty +kitten clipboard'
  kitty +kitten clipboard $argv; 
end
