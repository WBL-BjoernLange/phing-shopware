<?php
    /**
     * ./src/PhingShopware/Trait/DatabaseWriter.php
     * @author blange <code@wbl-konzept.de>
     * @package phingShopware
     * @version $id$
     */

    namespace PhingShopware\Helper;
    use \Shopware\Recovery\Common\Dump;

    /**
     * Trait to provide the basic install object for shopware.
     * @author blange <code@wbl-konzept.de>
     * @package phingShopware
     * @version $id$
     */
    trait DatabaseWriter
    {
        use DatabaseInstaller;

        /**
         * Returns the class to install shopware.
         * @param  string $file Filename to the database file.
         * @return null|\Shopware\Recovery\Install\Database
         * @throws \BuildException If there is something wrong.
         */
        protected function writeToSWDatabase($file)
        {
            $return = false;

            $install = $this->getSWInstallApp();

            $install->setDatabase();
            $db = $install->getDatabase();

            if ($error = $install->getError()) {
                throw new \BuildException('database error: ' . $error);
            } // if

            $dump = new Dump($file);

            foreach ($dump as $query) {
                if ($query) {
                    set_time_limit(0);

                    try {
                        $db->query($query);
                    } catch (\PDOException $exception) {
                        throw new \BuildException($exception->getMessage(), $exception->getCode());
                    } // catch
                } // if
            } // foreach

            return $return;
        } // function
    } // trait