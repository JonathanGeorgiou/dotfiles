package main

import (
	"bufio"
	"fmt"
	"io/ioutil"
	"os"
	"regexp"
	"strings"
	"time"
)

// Function to extract incomplete tasks with their subheadings
func extractIncompleteTasks(noteFile string) []string {
	file, err := os.Open(noteFile)
	if err != nil {
		fmt.Println("Error opening file:", err)
		return []string{}
	}
	defer file.Close()

	var result strings.Builder
	var currentSubheading string

	// Regular expression to identify incomplete tasks
	incompleteTaskRegex := regexp.MustCompile(`^\- \[ ] (.+)`)

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := scanner.Text()

		// Check for a subheading (e.g., ### Work)
		if strings.HasPrefix(line, "## TODO") {
			// If we already have a subheading, append it with tasks
			if currentSubheading != "" {
				result.WriteString("\n")
			}
			currentSubheading = line
			result.WriteString("\n")
		}

		// Check for incomplete tasks under the current subheading
		if incompleteTaskRegex.MatchString(line) {
			task := incompleteTaskRegex.FindStringSubmatch(line)[1]
			result.WriteString("  - [ ] " + task + "\n")
		}
	}

	if err := scanner.Err(); err != nil {
		fmt.Println("Error reading file:", err)
	}

	return strings.Split(result.String(), "\n")
}

func main() {
	// Define directories and filenames
	notesDir := os.Getenv("HOME") + "/notes/daily"
	templateFile := os.Getenv("HOME") + "/.local/bin/templates/daily-note.md"

	// Get today's and yesterday's date
	today := time.Now()
	todayStr := today.Format("Monday, 02 January 2006")
	monthStr := today.Format("01-January-06")
	dayOfWeek := today.Format("02-Jan-2006")
	yesterday := today.AddDate(0, 0, -1).Format("02-Jan-2006")

	// Paths
	noteDir := fmt.Sprintf("%s/%s", notesDir, monthStr)
	// Create dir if it doesn't exist
	err := os.MkdirAll(noteDir, os.ModePerm)
	if err != nil {
		fmt.Println("Error creating directory:", err)
		return
	}
	yesterdayNote := fmt.Sprintf("%s/%s.md", noteDir, yesterday)
	noteFile := fmt.Sprintf("%s/%s.md", noteDir, dayOfWeek)

	// Initialize todo list
	todoList := []string{}
	if _, err := os.Stat(yesterdayNote); err == nil {
		var err error
		todoList = extractIncompleteTasks(yesterdayNote)
		if err != nil {
			fmt.Println("Error reading yesterday's note:", err)
			return
		}
	}

	// If template exists, copy it and modify it
	if _, err := os.Stat(templateFile); err == nil {
		templateContent, err := ioutil.ReadFile(templateFile)
		if err != nil {
			fmt.Println("Error reading template file:", err)
			return
		}

		content := string(templateContent)

		// Replace {{DATE}} with today's date
		content = strings.Replace(content, "{{DATE}}", todayStr, -1)

		// Add incomplete tasks
		if len(todoList) > 0 {
			re := regexp.MustCompile(`(?m)^## TODO$`)
			index := re.FindStringIndex(content)
			if index != nil {
				content = content[:index[1]] + "\n" + strings.Join(todoList, "\n") + content[index[1]:]
			}
		}

		// Write back to the note file
		err = ioutil.WriteFile(noteFile, []byte(content), 0644)
		if err != nil {
			fmt.Println("Error writing note:", err)
			return
		}

		fmt.Printf("Note for %s created at %s\n", todayStr, noteFile)

	}
}
