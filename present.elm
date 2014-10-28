import Mouse
import Graphics.Input

clicks = Graphics.Input.input 0

main : Signal Element
main = (lift elm) (foldp move istart clicks.signal)

move x y = min (max (x + y) istart) ilast

ilast = 2
istart = 0

elm : Int -> Element
elm d = 
  flow down [
    flow left [
      Graphics.Input.button clicks.handle (1) "right"
      , Graphics.Input.button clicks.handle (-1) "left"
    ]
    , asText d
    , markdowns d
  ]

markdowns i = 
  head (drop i [
    [markdown|# Perl
         
    |]
    , [markdown|# 0.1: ElmのExample
          
          
    |]
    , [markdown|# 0.2:     
    |]
  ])     