﻿package d2data
{
    import d2network.JobDescription;
    import d2network.JobExperience;

    public class KnownJob 
    {


        public function get jobDescription():JobDescription
        {
            return (new JobDescription());
        }

        public function get jobExperience():JobExperience
        {
            return (new JobExperience());
        }

        public function get jobPosition():int
        {
            return (new int());
        }


    }
}//package d2data

