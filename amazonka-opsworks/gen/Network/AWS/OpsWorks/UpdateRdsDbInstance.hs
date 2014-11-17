{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE GeneralizedNewtypeDeriving  #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.OpsWorks.UpdateRdsDbInstance
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Updates an Amazon RDS instance.
module Network.AWS.OpsWorks.UpdateRdsDbInstance
    (
    -- * Request
      UpdateRdsDbInstance
    -- ** Request constructor
    , updateRdsDbInstance
    -- ** Request lenses
    , urdiDbPassword
    , urdiDbUser
    , urdiRdsDbInstanceArn

    -- * Response
    , UpdateRdsDbInstanceResponse
    -- ** Response constructor
    , updateRdsDbInstanceResponse
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.JSON
import Network.AWS.OpsWorks.Types
import qualified GHC.Exts

data UpdateRdsDbInstance = UpdateRdsDbInstance
    { _urdiDbPassword       :: Maybe Text
    , _urdiDbUser           :: Maybe Text
    , _urdiRdsDbInstanceArn :: Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'UpdateRdsDbInstance' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'urdiDbPassword' @::@ 'Maybe' 'Text'
--
-- * 'urdiDbUser' @::@ 'Maybe' 'Text'
--
-- * 'urdiRdsDbInstanceArn' @::@ 'Text'
--
updateRdsDbInstance :: Text -- ^ 'urdiRdsDbInstanceArn'
                    -> UpdateRdsDbInstance
updateRdsDbInstance p1 = UpdateRdsDbInstance
    { _urdiRdsDbInstanceArn = p1
    , _urdiDbUser           = Nothing
    , _urdiDbPassword       = Nothing
    }

-- | The database password.
urdiDbPassword :: Lens' UpdateRdsDbInstance (Maybe Text)
urdiDbPassword = lens _urdiDbPassword (\s a -> s { _urdiDbPassword = a })

-- | The master user name.
urdiDbUser :: Lens' UpdateRdsDbInstance (Maybe Text)
urdiDbUser = lens _urdiDbUser (\s a -> s { _urdiDbUser = a })

-- | The Amazon RDS instance's ARN.
urdiRdsDbInstanceArn :: Lens' UpdateRdsDbInstance Text
urdiRdsDbInstanceArn =
    lens _urdiRdsDbInstanceArn (\s a -> s { _urdiRdsDbInstanceArn = a })

data UpdateRdsDbInstanceResponse = UpdateRdsDbInstanceResponse
    deriving (Eq, Ord, Show, Generic)

-- | 'UpdateRdsDbInstanceResponse' constructor.
updateRdsDbInstanceResponse :: UpdateRdsDbInstanceResponse
updateRdsDbInstanceResponse = UpdateRdsDbInstanceResponse

instance AWSRequest UpdateRdsDbInstance where
    type Sv UpdateRdsDbInstance = OpsWorks
    type Rs UpdateRdsDbInstance = UpdateRdsDbInstanceResponse

    request  = post
    response = nullResponse UpdateRdsDbInstanceResponse

instance ToPath UpdateRdsDbInstance where
    toPath = const "/"

instance ToHeaders UpdateRdsDbInstance

instance ToQuery UpdateRdsDbInstance where
    toQuery = const mempty

instance ToJSON UpdateRdsDbInstance where
    toJSON = genericToJSON jsonOptions
