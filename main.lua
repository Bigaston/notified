function love.load()
    notifData = love.image.newImageData("/sprites/Notif.png")
    love.window.setIcon(notifData)
    
    love.window.setTitle("Notified")
    love.window.setMode(310,500)
    
    fond = love.graphics.newImage("/sprites/Phone.png")
    
    mouse = {}
    mouse.sprite = {love.mouse.newCursor("/sprites/Mouse1.png"), love.mouse.newCursor("/sprites/Mouse2.png")}
    mouse.select = 2
    
    logo = {}
    logo.dossier = love.graphics.newImage("/sprites/Icon_Dossier.png")
    logo.mail = love.graphics.newImage("/sprites/Icon_Mail.png")
    logo.nav = love.graphics.newImage("/sprites/Icon_Navigateur.png")
    logo.patreon = love.graphics.newImage("/sprites/Icon_Patreon.png")
    logo.sms = love.graphics.newImage("/sprites/Icon_SMS.png")
    logo.spotify = love.graphics.newImage("/sprites/Icon_Spotify.png")
    logo.tel = love.graphics.newImage("/sprites/Icon_Telephone.png")
    logo.tumblr = love.graphics.newImage("/sprites/Icon_Tumblr.png")
    logo.itch = love.graphics.newImage("/sprites/Icon_Itch.png")
    logo.github = love.graphics.newImage("/sprites/Icon_Github.png")
    logo.notif = love.graphics.newImage("/sprites/Notif_Mini.png")
    logo.ko_fi = love.graphics.newImage("/sprites/Icon_KoFi.png")
    
    monogram = love.graphics.newFont("monogram.ttf", 40)
    monogram_kofi = love.graphics.newFont("monogram.ttf", 30)
    
    require "dossier"
    require "nav"
    require "patreon"
    require "spotify"
    require "ko_fi"
    
    dossier_init()
    nav_init()
    patreon_init()
    spotify_init()
    kofi_init()
    
    win = {}
    win.dossier = false
    win.nav = false
    win.patreon = false
    win.spotify = false
    
    screen = "menu"
end

function love.update()
    mouse.x, mouse.y = love.mouse.getPosition()
    
    if mouse.x >= 120 and mouse.x <= 190 and mouse.y >= 450 and mouse.y <= 490 and love.mouse.isDown(1) then
        screen = "menu" 
    end
    
    if screen == "menu" then
        mouse_test()
    elseif screen == "dossier" then
        dossier_update()
    elseif screen=="nav" then
        nav_update()
    elseif screen=="patreon" then
        patreon_update()
    elseif screen=="spotify" then
        spotify_update()
    elseif screen=="ko_fi" then
        kofi_update()
    end
end

function love.draw()
    love.graphics.draw(fond)
    
    if screen=="menu" then
        menu_draw() 
    elseif screen=="dossier" then
        dossier_draw() 
    elseif screen=="nav" then
        nav_draw()
    elseif screen=="patreon" then
        patreon_draw()
    elseif screen=="spotify" then
        spotify_draw()
    elseif screen=="ko_fi" then
        kofi_draw()
    end
end

function menu_draw()
    love.graphics.setFont(monogram)
    
    love.mouse.setCursor(mouse.sprite[mouse.select])
    
    love.graphics.draw(logo.dossier, 30, 85)
    if not win.dossier then
        love.graphics.draw(logo.notif, 80, 75)
    end
    
    love.graphics.draw(logo.nav, 122, 85)
    if not win.nav then
        love.graphics.draw(logo.notif, 172, 75)    
    end
    
    love.graphics.draw(logo.mail, 215, 85)
    
    love.graphics.draw(logo.spotify, 30, 170)
    
    love.graphics.draw(logo.patreon, 122, 170)
    love.graphics.draw(logo.notif, 172, 160)  
    
    love.graphics.draw(logo.tumblr, 215, 170)
    
    love.graphics.draw(logo.itch, 30, 255)
    love.graphics.draw(logo.github, 215, 255)
    love.graphics.draw(logo.tel, 30, 340)
    love.graphics.draw(logo.sms, 215, 340)
    
    love.graphics.draw(logo.ko_fi, 122, 340)
    love.graphics.draw(logo.notif, 172, 330) 
end

function mouse_test()
    if mouse.y >= 85 and mouse.y <= 149 and mouse.x >= 30 and mouse.x <= 94 then
        mouse.select = 1
        
        if love.mouse.isDown(1) then
            mouse.select = 2
            dossier_init()
            screen = "dossier" 
        end
    elseif mouse.y >= 85 and mouse.y <= 149 and mouse.x >= 122 and mouse.x <= 186 then
        mouse.select = 1
        
        if love.mouse.isDown(1) then
            mouse.select = 2
            nav_init()
            screen = "nav"
        end    
    elseif mouse.y >= 170 and mouse.y <= 234 and mouse.x >= 122 and mouse.x <= 186 then
        mouse.select = 1
        
        if love.mouse.isDown(1) then
            mouse.select = 2
            screen = "patreon"
        end
    elseif mouse.y >= 255 and mouse.y <= 319 and mouse.x >= 30 and mouse.x <= 94 then
        mouse.select = 1
    elseif mouse.y >= 255 and mouse.y <= 319 and mouse.x >= 215 and mouse.x <= 279 then
        mouse.select = 1
        
    elseif mouse.y >= 340 and mouse.y <= 404 and mouse.x >= 122 and mouse.x <= 186 then
        mouse.select = 1
        
        if love.mouse.isDown(1) then
            mouse.select = 2
            screen = "ko_fi"
        end
    else
        mouse.select = 2
    end
end

function love.keypressed(key)
    if screen == "nav" then
        if key == "up" then
            if table.getn(nav.our_bullet) < 1 then
                table.insert(nav.our_bullet, {x = nav.loupe.x + 8, y = 380})
            end
        end
    end
    
    if screen == "dossier" then
        if key == "a" then
            dossier.ball.move = true 
        end
    end
end

function love.mousepressed(x, y, button)
    if screen == "patreon" then
        if y >= 370 and y <= 440 and button == 1 then
            patreon.number = patreon.number + 1
            patreon.sold = patreon.sold + math.floor(math.random(11))
        end
    end
    
    if screen == "ko_fi" then
        if y >= 380 and y <= 430 and x >= 30 and x <= 280 and button == 1 then
            love.system.openURL("https://ko-fi.com/bigaston")
        end
    end
    
    if screen == "menu" then
        if mouse.y >= 255 and mouse.y <= 319 and mouse.x >= 30 and mouse.x <= 94 then
             love.system.openURL("https://bigaston.itch.io/notified")
        end
        
        if mouse.y >= 255 and mouse.y <= 319 and mouse.x >= 215 and mouse.x <= 279 then
            love.system.openURL("https://github.com/Bigaston/notified")
        end
    end
end