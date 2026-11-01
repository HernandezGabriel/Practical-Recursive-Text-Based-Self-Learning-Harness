# Demo GUI — Screen Interrupt with Close Button
# Launches a topmost window that interrupts the screen.
# Requires Windows PowerShell 5.1 (built-in .NET Windows Forms).

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Screen Interrupt"
$form.Size = New-Object System.Drawing.Size(500, 300)
$form.StartPosition = "CenterScreen"
$form.TopMost = $true        # Stays on top of other windows
$form.FormBorderStyle = "FixedSingle"
$form.MaximizeBox = $false

# Make it grab focus (interrupt the user)
$form.Activate()
$form.TopMost = $true

# Close button
$closeButton = New-Object System.Windows.Forms.Button
$closeButton.Location = New-Object System.Drawing.Point(190, 220)
$closeButton.Size = New-Object System.Drawing.Size(120, 40)
$closeButton.Text = "Close"
$closeButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $closeButton
$form.Controls.Add($closeButton)

# Instruction label
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(120, 100)
$label.Size = New-Object System.Drawing.Size(260, 60)
$label.Text = "This GUI is interrupting your screen.`nClick Close to dismiss."
$label.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$form.Controls.Add($label)

# Show the modal dialog
$result = $form.ShowDialog()

# Cleanup
$form.Dispose()

if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    Write-Output "GUI closed by user."
}