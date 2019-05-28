function love.load()

    love.window.setMode(400, 240, {resizable=false, display=2})

    center_x = 200
    center_y = 120

    function update_circler(circler, dt)
        circler.current_radians = circler.current_radians + (circler.speed * dt)
        circler.x = math.sin(circler.current_radians) * circler.radius_from_center + center_x
        circler.y = math.cos(circler.current_radians) * circler.radius_from_center + center_y
    end

    function draw_circler(circler)
        love.graphics.circle("fill", circler.x, circler.y, 3)
    end

    circlers = {
        {
            x = 200,
            y = 40,
            radius_from_center = 50,
            speed = 0.8,
            current_radians = math.pi
        },
        {
            x = 200,
            y = 40,
            radius_from_center = 75,
            speed = 1.2,
            current_radians = 0
        }
    }
end

function love.update(dt)
    for i, c in ipairs(circlers) do
        update_circler(c, dt)
    end
end

function love.draw()
    love.graphics.circle("fill", 200, 120, 5)
    for i, c in ipairs(circlers) do
        draw_circler(c)
    end
end