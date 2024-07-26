$urls = @(
    "https://raw.githubusercontent.com/Gethe/wow-ui-source/live/Interface/AddOns/Blizzard_Fonts_Shared/SharedFonts.xml",
    "https://raw.githubusercontent.com/Gethe/wow-ui-source/live/Interface/AddOns/Blizzard_Fonts_Frame/Mainline/Fonts.xml"
)

$maxLength = 42

foreach ($url in $urls)
{
    # Create a WebClient object to download the XML content
    $client = New-Object System.Net.WebClient
    $xmlContent = $client.DownloadString($url)

    # Create an XmlDocument object and load the XML content
    $xmlDoc = New-Object System.Xml.XmlDocument
    $xmlDoc.LoadXml($xmlContent)

    # Define the XML namespace
    $ns = New-Object Xml.XmlNamespaceManager($xmlDoc.NameTable)
    $ns.AddNamespace("ns", "http://www.blizzard.com/wow/ui/")

    # Find all FontFamily elements
    $fontFamilies = $xmlDoc.SelectNodes("//ns:FontFamily", $ns)
    $parsedFontFamilies = @{}
    $longestName = 0

    # Output the FontFamily names, height, and shadow offset from the roman alphabet
    foreach ($fontFamily in $fontFamilies) {
        $name = $fontFamily.GetAttribute("name")
        $romanMember = $fontFamily.SelectSingleNode("./ns:Member[@alphabet='roman']/ns:Font", $ns)
        $height = $romanMember.GetAttribute("height")
        $style = $romanMember.GetAttribute("outline")
        switch ($style)
        {
            "NORMAL" {$style = "OUTLINE"}
            "THICK" {$style = "THICKOUTLINE"}
            Default {$style = ""}
        }
        $color = $romanMember.SelectSingleNode("./ns:Color", $ns)
        $colorR = "nil"
        $colorG = "nil"
        $colorB = "nil"
        if ($color)
        {
            $colorR = $color.GetAttribute("r")
            $colorG = $color.GetAttribute("g")
            $colorB = $color.GetAttribute("b")
        }
        $shadowOffset = $romanMember.SelectSingleNode("./ns:Shadow/ns:Offset/ns:AbsDimension", $ns)
        $shadowOffsetX = "nil"
        $shadowOffsetY = "nil"
        if ($shadowOffset)
        {
            $shadowOffsetX = $shadowOffset.GetAttribute("x")
            $shadowOffsetY = $shadowOffset.GetAttribute("y")
        }
        $shadowColor = $romanMember.SelectSingleNode("./ns:Shadow/ns:Color", $ns)
        $shadowColorR = "nil"
        $shadowColorG = "nil"
        $shadowColorB = "nil"
        if ($shadowColor)
        {
            $shadowColorR = $shadowColor.GetAttribute("r")
            $shadowColorG = $shadowColor.GetAttribute("g")
            $shadowColorB = $shadowColor.GetAttribute("b")
        }
        $parsedFontFamilies.Add($name, @{
            name = $name
            height = $height
            style = $style
            colorR = $colorR
            colorG = $colorG
            colorB = $colorB
            shadowColorR = $shadowColorR
            shadowColorG = $shadowColorG
            shadowColorB = $shadowColorB
            shadowOffsetX = $shadowOffsetX
            shadowOffsetY = $shadowOffsetY
        })

        if ($longestName -lt $name.Length)
        {
            $longestName = $name.Length
        }
    }

    foreach($key in $parsedFontFamilies.keys)
    {
        $value = $parsedFontFamilies[$key]
        $spacer = " "*($maxLength - $key.Length)
        Write-Host "self:SetFont($key,$($spacer)NORMAL, $($value.height), `"$($value.style)`", $($value.colorR), $($value.colorG), $($value.colorB), $($value.shadowColorR), $($value.shadowColorG), $($value.shadowColorB), $($value.shadowOffsetX), $($value.shadowOffsetY))"
    }
}
