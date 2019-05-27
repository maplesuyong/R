df_batter <- data.frame(player = c("양준혁", "이종범", "이승엽", "박재홍"),
                        hit1 = c(2500, 3000, 3500, 2000),
                        homerun = c(300, 200, 350, 300))
df_batter
df_batter$hitlong <- (df_batter$hit1-df_batter$homerun)/2
df_batter
