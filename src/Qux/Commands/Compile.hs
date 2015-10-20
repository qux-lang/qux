
{-|
Module      : Qux.Commands.Compile

Copyright   : (c) Henry J. Wylde, 2015
License     : BSD3
Maintainer  : public@hjwylde.com
-}

module Qux.Commands.Compile (
    -- * Options
    Options(..),

    -- * Handle
    handle,
) where

import qualified Qux.Commands.Build as Build


data Options = Options {
    optDestination  :: FilePath,
    optFormat       :: Build.Format,
    optLibdirs      :: [FilePath],
    argFilePaths    :: [FilePath]
    }
    deriving (Eq, Show)


handle :: Options -> IO ()
handle options = Build.handle $ buildOptions options

buildOptions :: Options -> Build.Options
buildOptions options = Build.defaultOptions {
    Build.optCompile        = True,
    Build.optDestination    = optDestination options,
    Build.optFormat         = optFormat options,
    Build.optLibdirs        = optLibdirs options,
    Build.optTypeCheck      = True,
    Build.argFilePaths      = argFilePaths options
    }

