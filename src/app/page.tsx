import Image from "next/image";

export default function Home() {
  return (
    <div className="flex flex-col flex-1 items-center justify-center min-h-screen bg-zinc-50 font-sans dark:bg-zinc-900">
      <main className="flex flex-col items-center justify-center w-full flex-1 px-20 text-center">
        <h1 className="text-6xl font-bold mb-4 text-black dark:text-white">
          SE4453 Final Project
        </h1>
        <h2 className="text-4xl font-semibold mb-8 text-blue-600">
          Group 10
        </h2>
        
        <p className="mt-3 text-2xl text-zinc-600 dark:text-zinc-300">
          Next.js Application running on Azure App Service
        </p>

        <div className="flex flex-wrap items-center justify-around max-w-4xl mt-12 sm:w-full">
          <div className="p-6 mt-6 text-left border rounded-xl dark:border-zinc-700 w-96 hover:shadow-lg transition-shadow bg-white dark:bg-zinc-800">
            <h3 className="text-2xl font-bold mb-2 text-black dark:text-white">CI/CD Pipeline &rarr;</h3>
            <p className="mt-4 text-xl text-zinc-600 dark:text-zinc-300">
              Automated deployments using GitHub Actions.
            </p>
          </div>

          <div className="p-6 mt-6 text-left border rounded-xl dark:border-zinc-700 w-96 hover:shadow-lg transition-shadow bg-white dark:bg-zinc-800">
            <h3 className="text-2xl font-bold mb-2 text-black dark:text-white">Infrastructure &rarr;</h3>
            <p className="mt-4 text-xl text-zinc-600 dark:text-zinc-300">
              ACR, KeyVault, PostgreSQL, and User Assigned Identity.
            </p>
          </div>
        </div>
      </main>
    </div>
  );
}
