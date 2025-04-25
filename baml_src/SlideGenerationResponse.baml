class SlideGenerationResponse {
  elements SlideElement[]
}
class SlideElement {
  type string
  data SlideElementData
}

class SlideElementData {
  text string ?
  shape string ?
  url string ?
  chartType string ?
  data ChartDataset[] ?
  options ChartOptions ?
}

class ChartDataset {
  labels string[]
  values float[]
  chartColors string[]
}

class ChartOptions {
  x float
  y float
  w float
  h float
  showLegend bool ?
  showVal bool ?
  dataLabelColor string ?
  catAxisLabelColor string ?
  valAxisLabelColor string ?
  fill FillColor ?
  line LineStyle ?
  fontSize float ?
  color string ?
  bold bool ?
  align string ?
}

class FillColor {
  color string
}

class LineStyle {
  color string
  width float
}

function EditSlideGPTCall(prompt: string, inputContext:string, selectedText:string) -> SlideGenerationResponse {
  client CustomGPT4o
  prompt #"""
You are an AI assistant that helps consultatnts edit and create slides using pptgenjs commands. You are provided as examples two cases,
case 1 is related to "delete those elements and just make a line graph depicting dollars spent increase" The other is "Generate a BCG
consulting slide related to mobile app usage". You will be provided with any relevant (or maybe not) selected text, the 
data from the current slide as context, and a user prompt. Think carefully and wisely, and generalize outside of these examples. You will recieve 
markdown of the entire presentation in order to preserve wording and content as well as other data about the slide you are making code for specifically.
Selected text does not always relate to the prompt, but it may.

IMPORTANT: The slide dimensions are 10 inches wide by 7.5 inches high. All x, y, w, h values in the options should be within these bounds:
- x: 0 to 10 (horizontal position)
- y: 0 to 7.5 (vertical position)
- w: 0 to 10 (width)
- h: 0 to 7.5 (height)



Example 1: BCG Slide Generation
Command: "Based on the document, create a slide related to mobile app usage"
OUTPUT EXACTLY THIS:{
  "elements": [
  {
  "type": "addChart",
  "data": {
    "chartType": "bar",
   "data": [
      {
        "labels": ["2015", "2024"],
        "values": [3.5, 4.6],
        "chartColors": ["7CB594"],

      }
    ],
    "options": {
      "x": 0.6,
      "y": 1.5,
      "w": 2.5,
      "h": 3.4,
      "showLegend": true,
      "showVal": false,
      "dataLabelColor": "FFFFFF", 
      "catAxisLabelColor": "FFFFFF", 
      "valAxisLabelColor": "FFFFFF"  
    }
  }
},
{
    "type": "addShape",
    "data": {
      "shape": "rect",
      "options": {
        "x": 3.5,
        "y": 2.8,
        "w": 3.5,
        "h": 0.5,
        "fill": { "color": "5E9B76" }
      }
    }
  },
  {
  "type": "addChart",
  "data": {
    "chartType": "bar",
   "data": [
      {
        "labels": ["2015", "2024"],
        "values": [3.5, 5.8],
        "chartColors": ["7CB594"]

      }
    ],
    "options": {
      "x": 7.2,
      "y": 1.5,
      "w": 2.5,
      "h": 3.5,
      "showLegend": true,
      "showVal": false,
       "dataLabelColor": "FFFFFF",  
      "catAxisLabelColor": "FFFFFF", 
      "valAxisLabelColor": "FFFFFF"  
    }
  }
},

  {
    "type": "addText",
    "data": {
      "text": "Mobile App Usage Report 2025",
      "options": {
        "x": 0.5,
        "y": -0.5,
        "w": 9.0,
        "h": 0.5s,
        "fontSize": 32,
        "color": "F4A460",
        "bold": true
      }
    }
  },
  {
    "type": "addText",
    "data": {
      "text": "Digital Engagement Trends and Key Insights",
      "options": {
        "x": 0.5,
        "y": 0.1,
        "w": 9.0,
        "h": 0.2
        "fontSize": 20,
        "color": "F4A460"
      }
    }
  },
  
  {
    "type": "addText",
    "data": {
      "text": "Users expect a ~30% increase in screen time compared to 2015",
      "options": {
        "x": 0.8,
        "y": 0.8,
        "w": 2.0,
        "h": 0.55
        "fontSize": 13,
        "color": "FFFFFF",
        "align": "center",
        "bold": true
      }
    }
  },
  {
    "type": "addText",
    "data": {
      "text": "But if these improvements are made in mobile app usage",
      "options": {
        "x": 3.5,
        "y": 0.7,
        "w": 2.5,
        "h": 0.55

        "fontSize": 13,
        "color": "FFFFFF",
        "align": "center"
      }
    }
  },
   {
      "type": "addShape",
      "data": {
        "shape": "line",
        "options": {
          "x": 3.0,
          "y": 1.0,
          "w": 4.0,
          "h": 1.0,
          "fill": {
            "color": "000000"
          }
        }
      }
    },
    
  {
    "type": "addText",
    "data": {
      "text": "Screentime could increase ~40%",
      "options": {
        "x": 7.0,
        "y": 0.7,
        "w": 2.5,
        "h": 0.55


        "fontSize": 13,
        "color": "FFFFFF",
        "align": "center"
      }
    }
  },
  {
    "type": "addShape",
    "data": {
      "shape": "rect",
      "options": {
        "x": 3.5,
        "y": 3.8,
        "w": 3.5,
        "h": 0.5,
        "fill": { "color": "5E9B76" }
      }
    }
  },
  {
    "type": "addShape",
    "data": {
      "shape": "line",
      "options": {
        "x": 3.5,
        "y": 1.5,
        "w": 4.0,
        "h": 0,
        "line": { "color": "FFFFFF", "width": 2 }
      }
    }
  },
  {
    "type": "addText",
    "data": {
      "text": "Improvement",
      "options": {
        "x": 3.5,
        "y": 1.5,
        "w": 2.0,
        "h": 0.5,
        "fontSize": 14,
        "color": "FFFFFF",
        "bold": true
      }
    }
  },
  {
    "type": "addText",
    "data": {
      "text": "Score¹",
      "options": {
        "x": 5.6,
        "y": 1.5,
        "w": 1.5,
        "h": 0.5,

        "fontSize": 14,
        "color": "FFFFFF",
        "bold": true,
        "align": "center"
      }
    }
  },
  {
    "type": "addShape",
    "data": {
      "shape": "line",
      "options": {
        "x": 3.5,
        "y": 2.2,
        "w": 4.0,
        "h": 0,
        "line": { "color": "FFFFFF", "width": 1 }
      }
    }
  },
  {
    "type": "addText",
    "data": {
      "text": "Improved app personalization",
      "options": {
        "x": 3.5,
        "y": 2.5,
        "w": 3.0,

        "fontSize": 12,
        "color": "FFFFFF"
      }
    }
  },
  {
    "type": "addShape",
    "data": {
      "shape": "oval",
      "options": {
        "x": 6.5,
        "y": 2.4,
        "w": 0.2,
        "h": 0.2,
        "fill": { "color": "FFFFFF" }
      }
    }
  },
  
  {
    "type": "addText",
    "data": {
      "text": "Better integration between apps & services	",
      "options": {
        "x": 3.5,
        "y": 3.0,
        "w": 3.0,

        "fontSize": 12,
        "color": "FFFFFF"
      }
    }
  },
  {
    "type": "addShape",
    "data": {
      "shape": "oval",
      "options": {
        "x": 6.5,
        "y": 2.9,
        "w": 0.2,
        "h": 0.2,
        "fill": { "color": "FFFFFF" }
      }
    }
  },
  // Row 3
  {
    "type": "addText",
    "data": {
      "text": "Apps providing real-time information	",
      "options": {
        "x": 3.5,
        "y": 3.6,
        "w": 3.0,


        "fontSize": 12,
        "color": "FFFFFF"
      }
    }
  },
  {
    "type": "addShape",
    "data": {
      "shape": "oval",
      "options": {
        "x": 6.5,
        "y": 3.5,
        "w": 0.2,
        "h": 0.2,
        "fill": { "color": "FFFFFF" }
      }
    }
  },  
  {
    "type": "addText",
    "data": {
      "text": "Entertainment value of mobile content",
      "options": {
        "x": 3.5,
        "y": 4.0,
        "w": 3.0,


        "fontSize": 12,
        "color": "FFFFFF"
      }
    }
  },
  {
    "type": "addShape",
    "data": {
      "shape": "pie",
      "options": {
        "x": 6.5,
        "y": 4.4,
        "w": 0.2,
        "h": 0.2,
        "fill": { "color": "FFFFFF" },
        "angleStart": 270,
        "angleEnd": 90
      }
    }
  },
  // Each remaining row would follow the same pattern
  // alternating background colors and using different pie slices for scores
  // I'll include a few more as examples
  
  // Row 5
  {
    "type": "addText",
    "data": {
      "text": "Apps simplifying daily tasks",
      "options": {
        "x": 3.5,
        "y": 4.5,
        "w": 3.0,


        "fontSize": 12,
        "color": "FFFFFF"
      }
    }
  },
  {
    "type": "addShape",
    "data": {
      "shape": "pie",
      "options": {
        "x": 6.5,
        "y": 3.9,
        "w": 0.2,
        "h": 0.2,
        "fill": { "color": "FFFFFF" },
        "angleStart": 0,
        "angleEnd": 180
      }
    }
  }
]
  
}

Example 2: Delete Case IF THE COMMAND IS WHATS WRITTEN BELOW, OUTPUT EVERYTHING NEEDED EXACTYL AS SHOWN.
Command: "replace those sections with a line graph visualizing the increase in dollars spent on mobile phones"
OUTPUT EXACTLY THIS:
Output:
{
  "elements": [
  {
    "type": "addText",
    "data": {
      "text": "Mobile App Usage Report 2025",
      "options": {
        "x": 0.5,
        "y": -0.5,
        "w": 9.0,
        "h": 0.5s,
        "fontSize": 32,
        "color": "F4A460",
        "bold": true
      }
    }
  },
  {
  "type": "addChart",
  "data": {
    "chartType": "bar",
   "data": [
      {
        "labels": ["2015", "2024"],
        "values": [3.5, 4.6],
        "chartColors": ["7CB594"],

      }
    ],
    "options": {
      "x": 0.6,
      "y": 1.5,
      "w": 2.5,
      "h": 3.4,
      "showLegend": true,
      "showVal": false,
      "dataLabelColor": "FFFFFF", 
      "catAxisLabelColor": "FFFFFF", 
      "valAxisLabelColor": "FFFFFF"  
    }
  }
},
 
  {
    "type": "addText",
    "data": {
      "text": "Digital Engagement Trends and Key Insights",
      "options": {
        "x": 0.5,
        "y": 0.1,
        "w": 9.0,
        "h": 0.5
        "fontSize": 20,
        "color": "F4A460"
      }
    }
  },
  
  {
    "type": "addText",
    "data": {
      "text": "Users on avg have experienced a ~30% increase in screen time since to 2015",
      "options": {
        "x": 0.8,
        "y": 0.8,
        "w": 2.0,
        "h": 0.55
        "fontSize": 13,
        "color": "FFFFFF",
        "align": "center",
        "bold": true
      }
    }
{
  "type": "addChart",
  "data": {
    "name": "10yr Mobile Phone Spend Projections (in Millions)",
    "chartType": "line",
   "data": [
      {
        "labels": ["2024", 2029, "2034"],
        "values": [4.5, 5.8, 7.4],
        "chartColors": ["7CB594"]

      }
    ],
    "options": {
      "x": 4.2,
      "y": 1.5,
      "w": 4.5,
      "h": 3.5,
      "showLegend": true,
      "showVal": false,
       "dataLabelColor": "FFFFFF",  
      "catAxisLabelColor": "FFFFFF", 
      "valAxisLabelColor": "FFFFFF"  
      }
    }
  }
},
  {
    "type": "addText",
    "data": {
      "text": "10yr projected increase in mobile app spend (millions)",
      "options": {
        "x": 5.3,
        "y": 0.8,
        "w": 2.0,
        "h": 0.55
        "fontSize": 13,
        "color": "FFFFFF",
        "align": "center",
        "bold": true
      }
    }
 
]
  
}
Remember, you might get a request outside of this scope, no matter what always output a consultant ready slide.

Make sure that all the elements are formatted correctly inside the slide. No elements should overlap or exceed the bounds of the ppt slide. Make sure
everything is formatted, sized, and aligned correctly.
MAKE SURE RESPONSE IS IN VALID JSON.
---

User command:
---
{{ prompt }}
---
Slide context:
---
{{inputContext}}
---
"""#
}

test TestSlidePrompt {
  functions [EditSlideGPTCall]
  args {
    prompt #"Make a slide related to our advantages over competitors"#
    inputContext #""#

  }
}
