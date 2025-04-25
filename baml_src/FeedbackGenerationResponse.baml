

class FeedbackGenerationResponse {
  elements SlideElement[]
}


function FeedbackGenerationCall(prompt: string, inputContext:string, selectedText:string) -> SlideGenerationResponse {
  client CustomGPT4o
  prompt #"""
You are a PowerPoint slide assistant that transforms slides based on embedded feedback written in shapes or boxes.

You are given:
- A **user command** (e.g. "Remake this slide based on my manager's feedback")
- A set of **Text Elements**, each with position and color
- The **chart data and structure**, if present

Your job:
1. **Identify feedback** embedded in text elements by using clues like:
   - Position outside normal slide content (e.g. near the top, far from charts)
   - Verbs and command phrasing ("change title", "fix this", "update data")
   - Color or formatting differences (empty or blue boxes are common)
2. **Preserve core content** unless feedback clearly overrides it.
3. Generate valid `pptgenjs` JSON to rewrite or edit the slide based on inferred commands.

---

### 🧠 Example

User command:
"Remake this slide based on my manager's feedback"

Slide context:
Text Elements:
1. "Country GDP Overview"  
   Position: 0.67in, 0.67in, 12.00in, 0.67in  
   Color: FF0000  
2. "None"  
   Position: 0.67in, 2.00in, 10.67in, 4.00in  
   Color:  
3. "Note: This slide provides a snapshot of the GDPs of key countries for better understanding of economic sizes and potential market opportunities."  
   Position: 0.67in, 6.27in, 12.00in, 0.67in  
   Color: 000000  
4. "change title"  
   Position: 0.95in, -0.45in, 6.44in, 0.91in  
   Color:  
5. "Remake slide with more accurate data"  
   Position: 6.00in, 2.41in, 5.64in, 1.02in  
   Color:  

---

Output:
```json
{
  "elements": [
    {
      "type": "addText",
      "data": {
        "text": "Updated Global GDP Overview (2023)",
        "options": {
          "x": 0.67,
          "y": 0.67,
          "w": 12.00,
          "h": 0.67,
          "fontSize": 32,
          "color": "FF0000",
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
            "labels": ["USA", "Germany", "China", "India"],
            "values": [25.1, 4.8, 19.9, 3.5],
            "chartColors": ["7CB594"]
          }
        ],
        "options": {
          "x": 0.67,
          "y": 2.00,
          "w": 10.67,
          "h": 4.00,
          "showLegend": false,
          "showVal": true,
          "dataLabelColor": "000000"
        }
      }
    },
    {
      "type": "addText",
      "data": {
        "text": "Note: This slide provides a snapshot of the GDPs of key countries for better understanding of economic sizes and potential market opportunities.",
        "options": {
          "x": 0.67,
          "y": 6.27,
          "w": 12.00,
          "h": 0.67,
          "fontSize": 12,
          "color": "000000"
        }
      }
    }
  ]
}
### 🧠 Example 2: Clone Slide Exactly

User command:
"Clone this slide exactly"

Slide context:
Text Elements:
1. "Country GDP Overview"  
   Position: 0.67in, 0.67in, 12.00in, 0.67in  
   Color: FF0000  
2. "None"  
   Position: 0.67in, 2.00in, 10.67in, 4.00in  
   Color:  
3. "Note: This slide provides a snapshot of the GDPs of key countries..."  
   Position: 0.67in, 6.27in, 12.00in, 0.67in  
   Color: 000000  

---

Output:
```json
{
  "elements": [
    {
      "type": "addText",
      "data": {
        "text": "Country GDP Overview",
        "options": {
          "x": 0.67,
          "y": 0.67,
          "w": 12.00,
          "h": 0.67,
          "fontSize": 32,
          "color": "FF0000",
          "bold": true
        }
      }
    },
    {
      "type": "addText",
      "data": {
        "text": "None",
        "options": {
          "x": 0.67,
          "y": 2.00,
          "w": 10.67,
          "h": 4.00,
          "fontSize": 14
        }
      }
    },
    {
      "type": "addText",
      "data": {
        "text": "Note: This slide provides a snapshot of the GDPs of key countries...",
        "options": {
          "x": 0.67,
          "y": 6.27,
          "w": 12.00,
          "h": 0.67,
          "fontSize": 12,
          "color": "000000"
        }
      }
    }
  ]
}
Remember: if the instruction is to "clone" the slide, your output should faithfully reproduce the elements with their original content, layout, and styling.

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
  functions [FeedbackGenerationCall]
  args {
    prompt #"Make a slide related to our advantages over competitors"#
    selectedText #""#

    inputContext #""#
    


  }
}
