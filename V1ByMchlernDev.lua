-- FreeAvaTopbar V1 (Delta Version) - BY MCHLERN DEV
-- Jangan hapus credit yawh
-- BY MCHLERN DEV

local Players = game:GetService("Players")
local TS = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local TOGGLE_IMAGE = "rbxassetid://134003209888315"
local PW, PH = 360, 470
local C = {
    white = Color3.new(1, 1, 1), base = Color3.fromRGB(8, 8, 10), top = Color3.fromRGB(26, 26, 31),
    bottom = Color3.fromRGB(8, 8, 10), blue = Color3.fromRGB(212, 175, 85),
    text = Color3.fromRGB(240, 240, 243), sub = Color3.fromRGB(150, 150, 160), shadow = Color3.new(0, 0, 0),
    line = Color3.fromRGB(70, 70, 80),
}
local FT, FB = Enum.Font.FredokaOne, Enum.Font.GothamMedium
local KINDS = {
    cyan = { Color3.fromRGB(16, 16, 20), Color3.fromRGB(200, 200, 208), C.white, true },
    blue = { Color3.fromRGB(150, 118, 42), C.blue, C.white, true },
    red = { Color3.fromRGB(190, 50, 62), Color3.fromRGB(230, 200, 200), C.white, true },
    white = { Color3.fromRGB(14, 14, 17), C.line, C.text, false },
}

local mainFrame, saveData

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end
local function corner(o, r) return new("UICorner", { CornerRadius = UDim.new(0, r) }, o) end
local function stroke(o, color, th)
    return new("UIStroke", { Color = color, Thickness = th, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, o)
end
local function lbl(parent, t, size, pos, ts, font, color, align)
    return new("TextLabel", {
        BackgroundTransparency = 1, Text = t, Size = size, Position = pos or UDim2.new(), TextSize = ts, Font = font,
        TextColor3 = color, TextXAlignment = align or Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd,
    }, parent)
end
local function applyKind(btn, kind)
    local k = KINDS[kind]
    btn.BackgroundColor3 = k[1]
    local s = btn:FindFirstChildOfClass("UIStroke")
    if s then s.Color = k[2] end
    btn.TextColor3 = k[3]
    btn.TextStrokeTransparency = k[4] and 0.4 or 1
end
local function styleBtn(btn, kind, radius, ts)
    btn.AutoButtonColor = false
    btn.BackgroundTransparency = 0
    btn.BorderSizePixel = 0
    btn.Font = FT
    btn.TextStrokeColor3 = C.shadow
    if ts then btn.TextSize = ts end
    stroke(btn, C.white, 2)
    corner(btn, radius or 12)
    applyKind(btn, kind)
    local sc = new("UIScale", {}, btn)
    local function to(s) TS:Create(sc, TweenInfo.new(0.12), { Scale = s }):Play() end
    btn.MouseEnter:Connect(function() to(1.05) end)
    btn.MouseLeave:Connect(function() to(1) end)
    btn.MouseButton1Down:Connect(function() to(0.94) end)
    btn.MouseButton1Up:Connect(function() to(1) end)
end
local function mkBtn(parent, t, size, pos, kind, radius, ts)
    local b = new("TextButton", { Text = t, Size = size, Position = pos }, parent)
    styleBtn(b, kind, radius, ts)
    return b
end
local function mkBox(ph, pos, size)
    local b = new("TextBox", {
        PlaceholderText = ph, Text = "", ClearTextOnFocus = false, Font = FB, TextSize = 14, TextColor3 = C.text,
        PlaceholderColor3 = C.sub, BackgroundColor3 = C.base, BorderSizePixel = 0, Position = pos, Size = size,
        TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd,
    }, mainFrame)
    corner(b, 15)
    stroke(b, C.line, 1.5)
    new("UIPadding", { PaddingLeft = UDim.new(0, 12) }, b)
    return b
end

local function mk(t)
    local r = {}
    for i, v in ipairs(t) do r[i] = { Name = v[1], Id = v[2] } end
    return r
end
local BOYS = mk{
    {"LORDVAN",7779810863},{"KIGEN",7803455979},{"PAPA AXIS",9051000061},{"KAWA",8480368946},{"ARAB MAKLUM",390085259},
    {"PALEKO",9276457701},{"BARA SALVATOR",8783890143},{"MAX SALVATOR",9211349293},{"COKLAT SALVATOR",8870105629},
    {"EL GASING",9082667974},{"VANTRA77",8867929655},{"RAWMOZE",8550285649},{"TACHYY21",8820257331},{"SKYZO",8990648245},
    {"KEN",8926737097},{"MOSSE",8188577636},{"HEEZAY",8542032465},
}
for _, id in ipairs{8611686392,9825617630,1151519774,8788315052,8950983678,7806970671,9055648623,8936710034,9069220763,8926737097,112347166} do
    table.insert(BOYS, { Name = "AVA", Id = id })
end
local GIRLS = mk{
    {"ALICE",6025920078},{"NANAKIYOWO",8765946015},{"CIEZLYN",8883807917},{"JENNIE",8831999951},{"SAVELA",8430092887},
    {"HANAS",9286934539},{"JEA",8503085977},{"IRA GEMOY",9219485225},{"ALACI",8668188657},
}
for _, id in ipairs{9320255342,9065312352,9164411811,8883099263,3399855479,9103879546,9429070000,9532930824,6161575675,9133212280,7923687818,8735235825,9055023328,7258898322,9382003744,8907935603,8993077830,8413455868,8616102005} do
    table.insert(GIRLS, { Name = "AVA", Id = id })
end
local ITEMS = mk{
    {"MAHKOTA ROYAL 8 BIT",10159600649},{"KUCING TABBY 8 BIT",10159617728},{"8 BIT KEHIDUPAN EKSTRA",10159606132},
    {"BAR HP 8 BIT",10159610478},{"KOIN ROBLOX 8 BIT",10159622004},
}

-- GUI parent (Delta: pakai gethui kalau ada)
local guiParent = playerGui
pcall(function()
    if gethui then guiParent = gethui() end
end)
for _, p in ipairs({ playerGui, guiParent }) do
    local old = p:FindFirstChild("AvatarTopGui")
    if old then old:Destroy() end
end

local gui = new("ScreenGui", {
    Name = "AvatarTopGui", ResetOnSpawn = false, IgnoreGuiInset = true,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = 999,
}, guiParent)

-- Tombol toggle (gambar) kiri atas, TIDAK bisa di-drag
-- Geser angka Position kalau nabrak icon Roblox
local button = new("ImageButton", {
    Name = "AvatarButton", Image = TOGGLE_IMAGE, BackgroundTransparency = 1, BorderSizePixel = 0,
    AnchorPoint = Vector2.new(0, 0), Position = UDim2.new(0, 100, 0, 6), Size = UDim2.new(0, 42, 0, 42),
    ScaleType = Enum.ScaleType.Fit, AutoButtonColor = false, Draggable = false,
}, gui)
local btnScale = new("UIScale", {}, button)
button.MouseEnter:Connect(function() TS:Create(btnScale, TweenInfo.new(0.12), { Scale = 1.08 }):Play() end)
button.MouseLeave:Connect(function() TS:Create(btnScale, TweenInfo.new(0.12), { Scale = 1 }):Play() end)
button.MouseButton1Down:Connect(function() TS:Create(btnScale, TweenInfo.new(0.12), { Scale = 0.92 }):Play() end)
button.MouseButton1Up:Connect(function() TS:Create(btnScale, TweenInfo.new(0.12), { Scale = 1 }):Play() end)

-- Panel utama, TIDAK bisa di-drag
mainFrame = new("Frame", {
    Name = "MainFrame", AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0),
    Size = UDim2.new(0, PW, 0, PH), BackgroundColor3 = C.white, BackgroundTransparency = 0.05,
    BorderSizePixel = 0, Visible = false, ZIndex = 10, Active = true, Draggable = false,
}, gui)
corner(mainFrame, 22)
stroke(mainFrame, C.line, 2.5)
new("UIGradient", { Color = ColorSequence.new(C.top, C.bottom), Rotation = 90 }, mainFrame)
local fit = new("UIScale", {}, mainFrame)
local function doFit()
    local vp = gui.AbsoluteSize
    if vp.X > 0 and vp.Y > 0 then
        fit.Scale = math.clamp(math.min((vp.X - 24) / PW, (vp.Y - 24) / PH), 0.4, 0.8)
    end
end
doFit()
gui:GetPropertyChangedSignal("AbsoluteSize"):Connect(doFit)

button.MouseButton1Click:Connect(function()
    if mainFrame.Visible then mainFrame.Visible = false return end
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 30)
    mainFrame.Visible = true
    TS:Create(mainFrame, TweenInfo.new(0.22, Enum.EasingStyle.Back), { Position = UDim2.new(0.5, 0, 0.5, 0) }):Play()
end)

mkBtn(mainFrame, "X", UDim2.new(0, 30, 0, 30), UDim2.new(1, -42, 0, 10), "red", 10, 16).MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

local pf = new("Frame", {
    Position = UDim2.new(0, 18, 0, 16), Size = UDim2.new(0, 110, 0, 110), BackgroundColor3 = C.base,
    BackgroundTransparency = 0.15, BorderSizePixel = 0,
}, mainFrame)
corner(pf, 16)
stroke(pf, C.line, 2)
local preview = new("ImageLabel", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), ScaleType = Enum.ScaleType.Fit, Image = "" }, pf)
local hint = lbl(pf, "Pilih avatar", UDim2.new(1, 0, 1, 0), nil, 13, FB, C.sub, Enum.TextXAlignment.Center)

lbl(mainFrame, "FREE AVATAR", UDim2.new(1, -190, 0, 26), UDim2.new(0, 140, 0, 14), 20, FT, C.text)
local nameLbl = lbl(mainFrame, "-", UDim2.new(1, -160, 0, 20), UDim2.new(0, 140, 0, 42), 16, FT, C.blue)
local idLbl = lbl(mainFrame, "ID: -", UDim2.new(1, -160, 0, 16), UDim2.new(0, 140, 0, 62), 12, FB, C.sub)
local statusLbl = lbl(mainFrame, "", UDim2.new(1, -160, 0, 14), UDim2.new(0, 140, 0, 79), 12, FB, C.text)

local applyBtn = mkBtn(mainFrame, "PAKAI", UDim2.new(0, 70, 0, 30), UDim2.new(0, 140, 0, 96), "blue", 12, 13)
local resetBtn = mkBtn(mainFrame, "RESET", UDim2.new(0, 60, 0, 30), UDim2.new(0, 216, 0, 96), "red", 12, 13)
local addBtn = mkBtn(mainFrame, "+ ADD", UDim2.new(0, 60, 0, 30), UDim2.new(0, 282, 0, 96), "cyan", 12, 13)
local manualBox = mkBox("ID atau Username..", UDim2.new(0, 18, 0, 140), UDim2.new(1, -180, 0, 30))
local cekBtn = mkBtn(mainFrame, "CEK", UDim2.new(0, 70, 0, 30), UDim2.new(1, -158, 0, 140), "cyan", 15, 13)
local copyBtn = mkBtn(mainFrame, "COPY", UDim2.new(0, 64, 0, 30), UDim2.new(1, -82, 0, 140), "blue", 15, 13)
local tabBoys = mkBtn(mainFrame, "COWOK", UDim2.new(0, 66, 0, 30), UDim2.new(0, 18, 0, 180), "blue", 15, 12)
local tabGirls = mkBtn(mainFrame, "CEWEK", UDim2.new(0, 66, 0, 30), UDim2.new(0, 88, 0, 180), "white", 15, 12)
local tabItems = mkBtn(mainFrame, "ITEM", UDim2.new(0, 66, 0, 30), UDim2.new(0, 158, 0, 180), "white", 15, 12)
local searchBox = mkBox("Cari..", UDim2.new(0, 228, 0, 180), UDim2.new(1, -246, 0, 30))

local list = new("ScrollingFrame", {
    Position = UDim2.new(0, 18, 0, 220), Size = UDim2.new(1, -36, 1, -236), BackgroundTransparency = 1,
    BorderSizePixel = 0, ScrollBarThickness = 4, ScrollBarImageColor3 = C.blue, CanvasSize = UDim2.new(),
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
}, mainFrame)
new("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }, list)

local tab, query, selected = "boys", "", nil
local selectedItems, rows, rowInfo = {}, {}, {}
local previewToken, busy, resolving = 0, false, false
local lastAvatar = nil

-- ===== PENYIMPANAN (file executor, tidak hilang walau rejoin) =====
local SAVE_FILE = "FreeAvaDelta.json"
local canFS = type(writefile) == "function" and type(readfile) == "function" and type(isfile) == "function"

saveData = function()
    if not canFS then return end
    local function customOf(t)
        local r = {}
        for _, e in ipairs(t) do
            if e.Custom then table.insert(r, { Name = e.Name, Id = e.Id }) end
        end
        return r
    end
    local sel = {}
    for id in pairs(selectedItems) do table.insert(sel, id) end
    pcall(function()
        writefile(SAVE_FILE, HttpService:JSONEncode({
            boys = customOf(BOYS), girls = customOf(GIRLS), items = customOf(ITEMS), sel = sel, last = lastAvatar,
        }))
    end)
end

local function loadData()
    if not canFS then return end
    local ok, data = pcall(function()
        if isfile(SAVE_FILE) then return HttpService:JSONDecode(readfile(SAVE_FILE)) end
    end)
    if not ok or type(data) ~= "table" then return end
    local function addAll(target, src)
        for _, e in ipairs(src or {}) do
            if type(e) == "table" and tonumber(e.Id) then
                table.insert(target, { Name = tostring(e.Name), Id = tonumber(e.Id), Custom = true })
            end
        end
    end
    addAll(BOYS, data.boys)
    addAll(GIRLS, data.girls)
    addAll(ITEMS, data.items)
    for _, id in ipairs(data.sel or {}) do
        if tonumber(id) then selectedItems[tonumber(id)] = true end
    end
    lastAvatar = tonumber(data.last)
end
loadData()

local function assetThumb(id) return "rbxthumb://type=Asset&id=" .. id .. "&w=150&h=150" end
local function countItems()
    local n = 0
    for _ in pairs(selectedItems) do n = n + 1 end
    return n
end
local function highlight()
    for _, r in ipairs(rowInfo) do
        local on = (tab == "items") and selectedItems[r.id] == true or (tab ~= "items" and selected ~= nil and selected.Id == r.id)
        r.row.BackgroundTransparency = on and 0.65 or 1
    end
end
local function setPreview(id)
    previewToken = previewToken + 1
    local my = previewToken
    preview.Image = ""
    task.spawn(function()
        for _ = 1, 6 do
            local ok, img, ready = pcall(function()
                return Players:GetUserThumbnailAsync(id, Enum.ThumbnailType.AvatarThumbnail, Enum.ThumbnailSize.Size150x150)
            end)
            if my ~= previewToken then return end
            if ok and img then
                preview.Image = img
                if ready then return end
            end
            task.wait(1)
        end
    end)
end
local function selectEntry(e)
    selected = e
    hint.Visible = false
    nameLbl.Text = e.Name
    idLbl.Text = "ID: " .. e.Id
    statusLbl.Text = ""
    setPreview(e.Id)
    highlight()
end
local function toggleItem(e)
    selectedItems[e.Id] = (not selectedItems[e.Id]) or nil
    previewToken = previewToken + 1
    hint.Visible = false
    preview.Image = assetThumb(e.Id)
    nameLbl.Text = countItems() .. " ITEM DIPILIH"
    idLbl.Text = "Tap item = pilih / batal"
    statusLbl.Text = ""
    highlight()
    saveData()
end

local function render()
    for _, r in ipairs(rows) do r:Destroy() end
    rows, rowInfo = {}, {}
    local data = tab == "boys" and BOYS or (tab == "girls" and GIRLS or ITEMS)
    local count = 0
    for idx, e in ipairs(data) do
        if query == "" or string.find(string.lower(e.Name), query, 1, true) or string.find(tostring(e.Id), query, 1, true) then
            count = count + 1
            local row = new("TextButton", {
                Text = "", AutoButtonColor = false, Size = UDim2.new(1, -8, 0, 44), LayoutOrder = idx,
                BackgroundColor3 = C.blue, BackgroundTransparency = 1, BorderSizePixel = 0,
            }, list)
            corner(row, 10)
            local x = 38
            if tab == "items" then
                x = 48
                new("ImageLabel", {
                    BackgroundTransparency = 1, Position = UDim2.new(0, 4, 0, 4), Size = UDim2.new(0, 36, 0, 36),
                    ScaleType = Enum.ScaleType.Fit, Image = assetThumb(e.Id),
                }, row)
            else
                lbl(row, tostring(idx), UDim2.new(0, 24, 1, 0), UDim2.new(0, 6, 0, 0), 13, FB, C.sub, Enum.TextXAlignment.Center)
            end
            local w = x + 12 + (e.Custom and 36 or 0)
            lbl(row, e.Name, UDim2.new(1, -w, 0, 22), UDim2.new(0, x, 0, 4), 15, FT, C.text)
            lbl(row, tostring(e.Id), UDim2.new(1, -w, 0, 14), UDim2.new(0, x, 0, 26), 11, FB, C.sub)
            if e.Custom then
                local del = new("TextButton", {
                    Text = "X", Size = UDim2.new(0, 28, 0, 28), Position = UDim2.new(1, -34, 0, 8), ZIndex = 2,
                }, row)
                styleBtn(del, "red", 8, 13)
                del.MouseButton1Click:Connect(function()
                    table.remove(data, idx)
                    selectedItems[e.Id] = nil
                    if tab ~= "items" and selected and selected.Id == e.Id then selected = nil end
                    saveData()
                    render()
                end)
            end
            row.MouseButton1Click:Connect(function()
                if tab == "items" then toggleItem(e) else selectEntry(e) end
            end)
            table.insert(rows, row)
            table.insert(rowInfo, { row = row, id = e.Id })
        end
    end
    if count == 0 then
        table.insert(rows, lbl(list, "Tidak ditemukan", UDim2.new(1, -8, 0, 40), nil, 14, FB, C.sub, Enum.TextXAlignment.Center))
    end
    highlight()
end

local function setTab(t)
    tab = t
    applyKind(tabBoys, t == "boys" and "blue" or "white")
    applyKind(tabGirls, t == "girls" and "blue" or "white")
    applyKind(tabItems, t == "items" and "blue" or "white")
    statusLbl.Text = ""
    previewToken = previewToken + 1
    manualBox.PlaceholderText = (t == "items") and "ID item.." or "ID / Username / Display.."
    if t == "items" then
        local n = countItems()
        hint.Text = "Pilih item"
        hint.Visible = (n == 0)
        if n == 0 then preview.Image = "" end
        nameLbl.Text = n == 0 and "ITEM" or (n .. " ITEM DIPILIH")
        idLbl.Text = "Tap item = pilih / batal"
    else
        hint.Text = "Pilih avatar"
        hint.Visible = (selected == nil)
        if selected then
            nameLbl.Text = selected.Name
            idLbl.Text = "ID: " .. selected.Id
            setPreview(selected.Id)
        else
            preview.Image = ""
            nameLbl.Text = "-"
            idLbl.Text = "ID: -"
        end
    end
    render()
end
tabBoys.MouseButton1Click:Connect(function() setTab("boys") end)
tabGirls.MouseButton1Click:Connect(function() setTab("girls") end)
tabItems.MouseButton1Click:Connect(function() setTab("items") end)
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    query = string.lower(searchBox.Text)
    render()
end)

local function resolveInput(raw)
    local text = string.gsub(string.gsub(raw or "", "^%s+", ""), "%s+$", "")
    if text == "" then return nil, "Isi ID atau username" end
    if string.match(text, "^%d+$") then
        local n = tonumber(text)
        local ok, name = pcall(function() return Players:GetNameFromUserIdAsync(n) end)
        if ok and name then return n, name end
    end
    local low = string.lower(text)
    for _, p in ipairs(Players:GetPlayers()) do
        if string.lower(p.DisplayName) == low or string.lower(p.Name) == low then
            return p.UserId, p.Name
        end
    end
    if not string.match(text, "^[%w_]+$") or #text < 3 or #text > 20 then return nil, "ID / username tidak valid" end
    local okId, uid = pcall(function() return Players:GetUserIdFromNameAsync(text) end)
    if not okId or not uid then return nil, "User tidak ditemukan" end
    local okName, realName = pcall(function() return Players:GetNameFromUserIdAsync(uid) end)
    return uid, (okName and realName) or text
end

-- ===== VERSI DELTA: semua lokal, tanpa RemoteFunction =====
local function getHum()
    local char = player.Character
    return char, char and char:FindFirstChildOfClass("Humanoid")
end

local function clearItems(char)
    for _, v in ipairs(char:GetChildren()) do
        if v:IsA("Accessory") and v:GetAttribute("FreeAvaItem") then
            v:Destroy()
        end
    end
end

local function applyAvatar(id)
    if busy then return false end
    local _, hum = getHum()
    if not hum then statusLbl.Text = "Karakter belum ada" return false end
    busy = true
    statusLbl.Text = "Memproses.."
    local ok, desc = pcall(function()
        return Players:GetHumanoidDescriptionFromUserId(id)
    end)
    local ok2 = ok and desc ~= nil and pcall(function() hum:ApplyDescription(desc) end)
    busy = false
    if ok2 then lastAvatar = id saveData() end
    statusLbl.Text = ok2 and "Berhasil dipakai!" or "Gagal, coba lagi"
    return ok2
end

local function applyItems(clear)
    local char, hum = getHum()
    if not hum then statusLbl.Text = "Karakter belum ada" return end
    clearItems(char)
    if clear then statusLbl.Text = "Item dilepas!" return end

    local n = 0
    local any = false
    for _, it in ipairs(ITEMS) do
        if selectedItems[it.Id] then
            any = true
            local ok, objs = pcall(function()
                return game:GetObjects("rbxassetid://" .. it.Id)
            end)
            local model = ok and objs and objs[1]
            local acc = model and (model:IsA("Accessory") and model or model:FindFirstChildWhichIsA("Accessory", true))
            if acc then
                acc:SetAttribute("FreeAvaItem", true)
                hum:AddAccessory(acc)
                n = n + 1
            end
        end
    end
    if not any then statusLbl.Text = "Pilih item dulu" return end
    statusLbl.Text = n > 0 and ("Berhasil! " .. n .. " item") or "Gagal, coba lagi"
end

local function addCustom()
    if resolving then return end
    resolving = true
    statusLbl.Text = "Mencari.."
    task.spawn(function()
        if tab == "items" then
            local id = tonumber(string.match(manualBox.Text, "%d+"))
            if not id then resolving = false statusLbl.Text = "Isi ID item" return end
            for _, it in ipairs(ITEMS) do
                if it.Id == id then resolving = false statusLbl.Text = "Item sudah ada" return end
            end
            local ok, info = pcall(function() return MarketplaceService:GetProductInfo(id) end)
            resolving = false
            if not ok or not info then statusLbl.Text = "ID item tidak valid" return end
            table.insert(ITEMS, { Name = string.upper(info.Name or "ITEM"), Id = id, Custom = true })
            saveData()
            manualBox.Text = ""
            statusLbl.Text = "Item ditambah!"
            render()
        else
            local id, nameOrErr = resolveInput(manualBox.Text)
            resolving = false
            if not id then statusLbl.Text = nameOrErr return end
            local data = (tab == "girls") and GIRLS or BOYS
            for _, e in ipairs(data) do
                if e.Id == id then statusLbl.Text = "Sudah ada di list" return end
            end
            local entry = { Name = string.upper(nameOrErr), Id = id, Custom = true }
            table.insert(data, entry)
            saveData()
            manualBox.Text = ""
            render()
            selectEntry(entry)
            statusLbl.Text = "Avatar ditambah!"
        end
    end)
end

local function checkManual(doApply)
    if resolving then return end
    resolving = true
    statusLbl.Text = "Mencari.."
    task.spawn(function()
        local id, nameOrErr = resolveInput(manualBox.Text)
        resolving = false
        if not id then statusLbl.Text = nameOrErr return end
        if tab == "items" then setTab("boys") end
        selectEntry({ Name = nameOrErr, Id = id })
        if doApply then applyAvatar(id) end
    end)
end
addBtn.MouseButton1Click:Connect(addCustom)
cekBtn.MouseButton1Click:Connect(function() checkManual(false) end)
copyBtn.MouseButton1Click:Connect(function() checkManual(true) end)
manualBox.FocusLost:Connect(function(enter) if enter then checkManual(false) end end)

applyBtn.MouseButton1Click:Connect(function()
    if tab == "items" then applyItems(false) return end
    if not selected then statusLbl.Text = "Pilih avatar dulu" return end
    applyAvatar(selected.Id)
end)
resetBtn.MouseButton1Click:Connect(function()
    if tab == "items" then
        selectedItems = {}
        saveData()
        nameLbl.Text = "ITEM"
        hint.Visible = true
        preview.Image = ""
        highlight()
        applyItems(true)
        return
    end
    applyAvatar(player.UserId)
    lastAvatar = nil
    saveData()
end)

-- Auto pasang lagi pas respawn
player.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid")
    task.wait(1)
    if lastAvatar then
        busy = false
        applyAvatar(lastAvatar)
        task.wait(0.3)
    end
    if next(selectedItems) then applyItems(false) end
end)

render()

-- Auto pasang yang tersimpan pas script dijalankan
task.spawn(function()
    local char = player.Character or player.CharacterAdded:Wait()
    char:WaitForChild("Humanoid")
    task.wait(1.5)
    if lastAvatar then
        applyAvatar(lastAvatar)
        task.wait(0.3)
    end
    if next(selectedItems) then applyItems(false) end
end)
