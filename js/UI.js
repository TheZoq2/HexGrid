
var b_endTurn;

function setupUI()
{
	bar_right = document.getElementById("UI_rightBar");
	//Getting HTML UI elements
	b_endTurn = document.getElementById("UI_b_endTurn");

	//Giving those elements function
	b_endTurn.onclick = endTurn;

	var buildingAmount = 1;
	//Creating building buttons
	for(var i = 0; i < buildingAmount; i++)
	{
		button = document.createElement("div");
		button.setAttribute("class", "UI_buildingButton");

		button.onclick = function(){selTool = 1; selID = 0;};

		bar_right.appendChild(button);
	}
}