import { createBrowserRouter } from "react-router-dom";
import { NotFound } from "./pages/notfound";
import { Login } from "./pages/auth/login";
import { Register } from "./pages/auth/register";
import { Layout } from "./components/layout";
import { User } from "./pages/user";
import { Permissions } from "./pages/permissions";

const router = createBrowserRouter([
  {
    path: '/login',
    element: <Login />
  },
  {
    path: '/register',
    element: <Register />
  },
  {
    element: <Layout />,
    children: [
      {
        path: '/minha-conta',
        element: <User />,
      },
      {
        path: '/permissions',
        element: <Permissions />,
      }
    ]
  },
  {
    path: '*',
    element: <NotFound />
  }
]);

export { router };
