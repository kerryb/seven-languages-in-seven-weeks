module MapColouring where

  data States = Alabama | Mississippi | Georgia | Tennessee | Florida
    deriving Show

  data Colours = Blue | Red | Green
    deriving (Eq, Show)

  stateColours = [[(Alabama, a), (Mississippi, m), (Georgia, g), (Tennessee, t), (Florida, f)]
    | a <- colours, m <- colours, g <- colours, t <- colours, f <- colours,
    m /= t, m /= a, a /= t, a /= m, a /= g, a /= f, g /= f, g /= t] where
    colours = [Blue, Red, Green]

