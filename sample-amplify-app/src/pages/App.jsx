/** **********************************************************************
                            DISCLAIMER

This is just a playground package. It does not comply with best practices
of using Cloudscape Design components. For production code, follow the
integration guidelines:

https://cloudscape.design/patterns/patterns/overview/
*********************************************************************** */
import React from 'react';
// eslint-disable-next-line no-unused-vars
import { Route, Routes, Link, useParams } from 'react-router-dom';

// Components
import { Amplify } from 'aws-amplify';
import { withAuthenticator } from '@aws-amplify/ui-react';
import Dashboard from './Dashboard';
import SampleHomePage from './SampleHomePage';
import SetupGuide from './SetupGuide';
import DataUploader from './DataUploader';
import AccountSettings from './AccountSettings';
import ErrorPage from './ErrorPage';
import S3Objects from './S3Objects';
import FetchUserDetails from '../common/components/FetchUserDetails';

// Styles
import '@cloudscape-design/global-styles/index.css';

// Amplify
// import Amplify, { Auth, Storage, API, graphqlOperation } from 'aws-amplify';

// eslint-disable-next-line import/no-unresolved
import '@aws-amplify/ui-react/styles.css';

// No touchy
import { AmplifyConfig } from '../config/amplify-config';

Amplify.configure(AmplifyConfig);

// eslint-disable-next-line react/prop-types
const App = ({ signOut, user }) => {
  // let { userId } = useParams();
  return (
    <>
      {/* <Authenticator loginMechanisms={['email']}  hideSignUp> */}
      {/* <Router> */}
      <FetchUserDetails user={user} signOut={signOut} />
      <Routes>
        <Route path="/" element={<Dashboard />} />
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/sample-101" element={<SampleHomePage />} />
        <Route path="/setup-guide" element={<SetupGuide />} />
        <Route path="/data-uploader" element={<DataUploader />} />
        <Route path="/account-settings" element={<AccountSettings />} />
        <Route path="/s3-objects" element={<S3Objects />} />
        <Route path="*" element={<ErrorPage />} />
      </Routes>
      {/* </Router> */}
      {/* </Authenticator> */}
    </>
  );
};

// export default App;
export default withAuthenticator(App);
