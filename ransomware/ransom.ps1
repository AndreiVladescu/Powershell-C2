# Load Windows Forms assembly
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Popup with Timer and Image"
$form.Size = New-Object System.Drawing.Size(1600, 300)
$form.StartPosition = "CenterScreen"

# Set the background image
Invoke-WebRequest -Uri "https://i.imgflip.com/51844q.jpg" -OutFile "$([Environment]::GetFolderPath('Desktop'))\shrek_ran.jpg"
$filePath = Join-Path $([Environment]::GetFolderPath('Desktop')) "shrek_ran.jpg"
$backgroundImage = [System.Drawing.Image]::FromFile($filePath)
$form.BackgroundImage = $backgroundImage
$form.BackgroundImageLayout = "Stretch"

# Text Label
$label1 = New-Object System.Windows.Forms.Label
$label1.Text = "Your personal files have been encrypted. Pay at this wallet:"
$label1.AutoSize = $true
$label1.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
$label1.BackColor = [System.Drawing.Color]::Transparent  # Transparent background
$label1.ForeColor = [System.Drawing.Color]::White        # White text color
$label1.Location = New-Object System.Drawing.Point(100, 50)

# Add countdown label to the form
$form.Controls.Add($label1)


# Text Label
$label2 = New-Object System.Windows.Forms.Label
$label2.Text = "48zVtNa8KmB2G5UrN6XB9VtPaX6Vc7J5Hx7fA9sK29Ge3MQzVcU2rF89yHXG7yV8tUCJXjLk5tYaHr8U4VqPyQpX5d9mTgqAxPbc6Qs49UJW4P3nGR7d"
$label2.AutoSize = $true
$label2.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
$label2.BackColor = [System.Drawing.Color]::Transparent  # Transparent background
$label2.ForeColor = [System.Drawing.Color]::White        # White text color
$label2.Location = New-Object System.Drawing.Point(100, 100)

# Add countdown label to the form
$form.Controls.Add($label2)

# Text Label
$label3 = New-Object System.Windows.Forms.Label
$label3.Text = "the value of 270356984 Monero coins (equivalent of 200 USD) to get your key"
$label3.AutoSize = $true
$label3.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
$label3.BackColor = [System.Drawing.Color]::Transparent  # Transparent background
$label3.ForeColor = [System.Drawing.Color]::White        # White text color
$label3.Location = New-Object System.Drawing.Point(100, 150)

# Add countdown label to the form
$form.Controls.Add($label3)

# Create a label that will act as a hyperlink
$hyperlinkLabel = New-Object System.Windows.Forms.Label
$hyperlinkLabel.Text = "More info"
$hyperlinkLabel.AutoSize = $true
$hyperlinkLabel.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Underline)
$hyperlinkLabel.BackColor = [System.Drawing.Color]::Transparent
$hyperlinkLabel.Cursor = [System.Windows.Forms.Cursors]::Hand
$hyperlinkLabel.ForeColor = [System.Drawing.Color]::Blue
$hyperlinkLabel.Location = New-Object System.Drawing.Point(100, 200)

# Add a click event handler to open a URL when clicked
$hyperlinkLabel.Add_Click({
    Start-Process "https://www.youtube.com/watch?v=L_jWHffIx5E"
})

# Add the label to the form
$form.Controls.Add($hyperlinkLabel)

# Show the form
$form.Topmost = $true  # Make the form appear on top of other windows
$form.ShowDialog()