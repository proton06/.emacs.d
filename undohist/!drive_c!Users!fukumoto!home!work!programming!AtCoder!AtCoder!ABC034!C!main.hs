
((digest . "4f12e3085bfb8c585027be135ab3c5f8") (undo-list nil ("-- solve w h = solve' w h where
--     memo = array ((1, 1), (w, h)) [((i, j), solve' i j) | i <- [1..w], j <- [1..h]]

--     solve' :: Int -> Int -> Int
--     solve' 1 _ = 1
--     solve' _ 1 = 1
--     solve' i j = (memo ! (i - 1, j) + memo ! (i, j - 1)) `mod` 1000000007
" . -235) ((marker . 235) . -276) ((marker . 39) . -120) ((marker . 39) . -120) ((marker . 29) . -155) ((marker . 29) . -155) ((marker . 114) . -32) ((marker . 114) . -32) ((marker . 235) . -176) ((marker . 1) . -199) ((marker . 1) . -199) ((marker . 235) . -14) ((marker . 28) . -177) ((marker . 28) . -177) ((marker . 235) . -198) ((marker . 235) . -276) ((marker . 235) . -276) ((marker . 82) . -119) ((marker . 82) . -119) ((marker . 235) . -31) ((marker . 235) . -264) ((marker . 235) . -276) ((marker . 235) . -265) ((marker . 235) . -274) ((marker . 235) . -265) ((marker . 235) . -176) ((marker . 235) . -176) ((marker . 235) . -198) ((marker . 235) . -276) ((marker . 235) . -96) ((marker . 235) . -176) ((marker . 235) . -250) ((marker) . -276) nil ("
" . 28) nil ("import Data.Array" . 28) ((marker . 28) . -17) ((marker) . -17) (t 22265 22837 0 0) nil ("In" . 171) ((marker . 153) . -2) (164 . 171) 166 nil ("e" . -166) nil (164 . 167) nil undo-tree-canary))
