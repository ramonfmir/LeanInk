import LeanInk.Configuration
import LeanInk.Logger

import Lean.Data.Json
import Lean.Data.Json.Printer

namespace LeanInk

open Lean
open System

def leanFileExtension := s!"lean"

def isLeanFile (path : FilePath) : Bool := 
  path.extension == leanFileExtension

-- OUTPUT
open IO.FS
def createOutputFile (folderPath : FilePath) (fileName : String) (content : String) : AnalysisM Unit := do
  let dirEntry : DirEntry := { 
    root := folderPath,
    fileName := fileName ++ ".leanInk"
  }
  let path := dirEntry.path
  IO.FS.writeFile path content
  logInfo s!"Results written to file: {path}!"

def generateOutput { α : Type } [ToJson α] (fragments : Array α) : AnalysisM String := do 
  let fragments := Json.arr <| (fragments.map toJson).filter (· != Json.null)
  if (← read).prettifyOutput then
    return (toJson fragments).pretty
  else
    return (toJson fragments).compress