# Target_flash

# EN
Blinds the specified player

To display in the admin menu, you must enter this code in  

/addons/sourcemod/configs/adminmenu_custom.txt

# RU
Ослепляет указанного игрока

Для отображения в меню админа, необходимо ввести данный код в  

/addons/sourcemod/configs/adminmenu_custom.txt

```
"Commands"
{
	"Проверка на читы"
	{
	
		"Вызвать на проверку"
		{
			"cmd"           "sm_cc"
			"admin"			"sm_ban"
		}
		
		"Ослепить игрока"
		{
			"cmd"           "sm_tflash #1 #2 #3"
			"title"			"Ослепить игрока"
			"execute"		"player"
			"admin"			"sm_ban"
			"1"
			{
				"type" 		"player"
				"method"	"name"
				"title"		"Ослепить игрока:"
			}
			"2"
			{
				"title"		"Выберите силу ослепления"
				"1"					"100"
				"1."				"Слабое"
				"2"					"170"
				"2."				"Сильное"
				"3"					"255"
				"3."				"Полное"
				"4"					"0"
				"4." 				"Снять ослепление"
			}
			"3"
			{
				"title"		"Продолжительность ослепления"
				"1"					"5"
				"1."				"5 секунд"
				"2"					"10"
				"2."				"10 секунд"
				"3"					"15"
				"3."				"15 секунд"
				"4"					"20"
				"4." 				"20 секунд"
			}
		}
	}
}
```

