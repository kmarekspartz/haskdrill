module Lib
    ( someFunc
    ) where

import Database.HDBC
import Database.HDBC.ODBC

someFunc :: IO ()
someFunc = do
  let connectionString = "DSN=Sample MapR Drill DSN"
  let ioconn = connectODBC connectionString
  conn <- ioconn
  vals <- quickQuery conn "SELECT * FROM dfs.`/some/path/to/a/csv`" []
  print vals
  return ()
