function spotify_init()
    spotify = {}
    
    spotify.back = love.graphics.newImage("/sprites/Spotify/Spotify_Background.png")
    
    spotify.cd = {}
    spotify.cd.off = {}
    spotify.cd.on = {}
    spotify.cd.statut = {false, false, false, false}
    
    table.insert(spotify.cd.off, love.graphics.newImage("/sprites/Spotify/Spotify_CD1.png"))
    table.insert(spotify.cd.off, love.graphics.newImage("/sprites/Spotify/Spotify_CD3.png"))
    table.insert(spotify.cd.off, love.graphics.newImage("/sprites/Spotify/Spotify_CD5.png"))
    table.insert(spotify.cd.off, love.graphics.newImage("/sprites/Spotify/Spotify_CD7.png"))
    
    table.insert(spotify.cd.on, love.graphics.newImage("/sprites/Spotify/Spotify_CD2.png"))
    table.insert(spotify.cd.on, love.graphics.newImage("/sprites/Spotify/Spotify_CD4.png"))
    table.insert(spotify.cd.on, love.graphics.newImage("/sprites/Spotify/Spotify_CD6.png"))
    table.insert(spotify.cd.on, love.graphics.newImage("/sprites/Spotify/Spotify_CD8.png"))
    
    spotify.note = {}
    spotify.tic = 60
    
    spotify_generate_note()
    
    spotify.demo_rank = 1
    spotify_demo(spotify.demo_rank)
    spotify.on_demo = true
end

function spotify_update()
    if spotify.tic ~= 0 then spotify.tic = spotify.tic - 1 end
    
    if spotify.on_demo then
        if spotify.tic == 0 then
            spotify_demo(spotify.demo_rank)
        end
    end
end

function spotify_draw()
    love.graphics.draw(spotify.back, 20, 60)
    love.graphics.print(spotify.tic)
    
    if spotify.cd.statut[1] then
        love.graphics.draw(spotify.cd.on[1], 30, 70)
    else
        love.graphics.draw(spotify.cd.off[1], 30, 70)
    end
    
    if spotify.cd.statut[2] then
        love.graphics.draw(spotify.cd.on[2], 160, 70)
    else
        love.graphics.draw(spotify.cd.off[2], 160, 70)
    end
        
    if spotify.cd.statut[3] then
        love.graphics.draw(spotify.cd.on[3], 30, 200)
    else
        love.graphics.draw(spotify.cd.off[3], 30, 200)
    end
    
    if spotify.cd.statut[4] then
        love.graphics.draw(spotify.cd.on[4], 160, 200)
    else
        love.graphics.draw(spotify.cd.off[4], 160, 200)    
    end
    
end

function spotify_generate_note()
    table.insert(spotify.note, math.floor(math.random(4)))
end

function spotify_demo(rank)
    if spotify.note[rank] == 1 then
        spotify.cd.statut[1] = true
        spotify.cd.statut[2] = false
        spotify.cd.statut[3] = false
        spotify.cd.statut[4] = false
        
    elseif spotify.note[rank] == 2 then
        spotify.cd.statut[2] = true
        spotify.cd.statut[1] = false
        spotify.cd.statut[3] = false
        spotify.cd.statut[4] = false
    elseif spotify.note[rank] == 3 then
        spotify.cd.statut[3] = true
        spotify.cd.statut[1] = false
        spotify.cd.statut[2] = false
        spotify.cd.statut[4] = false
    elseif spotify.note[rank] == 4 then
        spotify.cd.statut[4] = true
        spotify.cd.statut[1] = false
        spotify.cd.statut[2] = false
        spotify.cd.statut[4] = false
    end
    
    if spotify.demo_rank == table.getn(spotify.note) then
        spotify.on_demo = false
    else
        spotify.demo_rank = spotify.demo_rank + 1
    end
end