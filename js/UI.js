
var b_endTurn;

function setupUI()
{
	bar_right = document.getElementById("UI_rightBar");
	//Getting HTML UI elements
	b_endTurn = document.getElementById("UI_b_endTurn");

	//Giving those elements function
	b_endTurn.onclick = endTurn;

	var buildingAmount = 3;
	//Creating building buttons
	for(var i = 0; i < buildingAmount; i++)
	{
		button = document.createElement("div");
		button.setAttribute("class", "UI_buildingButton");
		button.setAttribute("ID", "buildnig_" + i);

		button.onclick = function(){
			selTool = 1;
			selID = 0;

			//Getting the ID of the building that that is referenced in the ID of the button
			var IDname = this.id;
			//Spliting the ID
			selID = parseInt(IDname.split("_")[1]);

			console.log(selID);
		};

		bar_right.appendChild(button);
	}
}