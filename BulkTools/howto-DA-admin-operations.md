# Important Notes
- To batch import, images must be zipped together with their corresponding xml metadata files.
- Zipped files must be less than 2 GB in size.

## Logging in 
- For all operations, ensure you're logged in to the Digital Archive http://digitalarchive.mcmaster.ca/user

## Batch Import:
- Navigate to the target collection (folder)
- Click on **Manage**
- Click on **Collection** tab
- Click on **Batch Import Objects**
- Select the required zip file and upload it. 
-- Select **Islandora Large Image Content Model**
-- For namespace, select **macrepo**
--Click **Import**

## Deleting items
- Navigate to the item that you want to delete
- Click on **Manage**
- Click on **Properties** tab
- Change the state to **Deleted**
- Click on **Update Properties**

## Missing Image derivatives
- Click on **Manage**
- Click on **Datastreams** tab
- If object exists:
-- Click **Properties** tab
-- Click **Regenerate all Derivatives**
- Move TIF/XML from H: Digitization Projects/ON_LakeMaps to  H: Digitization Projects/ON_LakeMaps/ingested
- Delete TIF/XML from zipfile
-- use 7zip

## Adding a new collection
*See full instructions in "H:\Digitization_Projects\Planning\Creating Folders in the Digital Archive.docx"*

- log into Digital Archive (if not already)
- Navigate to the parent folder for the new collection
- Click "Manage"
- Click "Add an object to this Collection"
- From Content Model dropdown, select "Islandora Collection Content Model"
- Ignore the Collection PID box.   
- If you are creating a primary folder, that is, a folder which will contain sub-folders, set the “collection policy” for the folder.  In order to do this, uncheck the “Inherit collection policy” box.  This will produce a list of content models.  
-- For map collections, only select: **Islandora Large Image Content Model** and **Islandora Collection Content Model** Secondary folders will inherit the properties of the primary folder.  
- Click ingest when ready.

## Replacing Metadata
Instructions on replacing metadata files for already-ingested items in the Digital Archive:

- Ensure you're logged in to the Digital Archive http://digitalarchive.mcmaster.ca/user
- If you've logged in but don't see the "View | Manage" tabs for an item, try replacing "https:" in the URL with "http:"

- Upload new metadata file (This assumes that a new metadata XML file has been created)
  - Navigate to the item in the digital archive
  - If logged in, you should see tabs: "View | Manage" -- select the **Manage** tab
  - In the Manage window, select the **Datastreams** sub-tab
  - For the MODS record, click **replace**
  - Choose the new XML file and upload it. 
  - Verify that the process applies correctly. 
