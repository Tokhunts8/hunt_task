<?php

class mainController
{

    public function showProjects($offset = 0)
    {
        $projects         = new Projects();
        $projectsArray    = $projects->limit(10)->offset($offset * 10)->get()->result_array();
        $data['projects'] = $projectsArray;
        $data['page']     = $offset;
        $data['pages']    = ceil($projects->selectCount() / 10);
        $path             = $_SERVER['DOCUMENT_ROOT'] . '/hunt_task/View/projects_table.php';
        return $this->render_php($path, $data);
    }

    public function showSkills()
    {
        $projectSkills = new Project_skills();
        $skills        = $projectSkills->select('skills.skill as skill, COUNT(project_skills.skill_id) as count')
            ->join('LEFT JOIN skills ON project_skills.skill_id = skills.id')
            ->groupBy('project_skills.skill_id')->get()->result_array();
        $path          = $_SERVER['DOCUMENT_ROOT'] . '/hunt_task/View/skills_table.php';
        return $this->render_php($path, $skills);
    }

    public function pieChart()
    {
        $prices  = $this->getPrices();
        $courses = $this->getExchangeCourses();
        $this->exchangeToUAH($prices, $courses);
        $groupedPrices = $this->groupPricesAndGetPercentage($prices);
        $path          = $_SERVER['DOCUMENT_ROOT'] . '/hunt_task/View/pie_chart.php';
        return $this->render_php($path, $groupedPrices);

    }

    private function getPrices()
    {
        $projects = new Projects();
        return $projects->select('amount, currency')->get()->result_array();
    }

    private function getExchangeCourses()
    {
        $url = 'https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5';
        $ch  = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        $server_output = curl_exec($ch);

        if (curl_errno($ch)) {
            print "Error: " . curl_error($ch);
            exit();
        }

        curl_close($ch);
        $server_output = json_decode($server_output, true);
        return $server_output;
    }

    private function exchangeToUAH(&$prices, $courses)
    {
        foreach ($prices as &$price) {
            if ($price['currency'] !== 'UAH' && $price['currency'] !== '') {

                // API privatbank return RUR... in freelancehunt saved as RUB
                $price['currency'] = $price['currency'] === 'RUB' ? 'RUR' : $price['currency'];

                foreach ($courses as $course) {
                    if ($course['ccy'] === $price['currency']) {
                        $price['amount']   = $price['amount'] * $course['buy'];
                        $price['currency'] = 'UAH';
                    }
                }
            }
        }
    }

    private function groupPricesAndGetPercentage($prices)
    {
        $groups = [
            'not specified' => [0],
            '0-500'         => [0, 500],
            '500-1000'      => [500, 1000],
            '1000-5000'     => [1000, 5000],
            '5000-10000'    => [5000, 10000],
            '10000-INF'     => [10000, INF],
        ];

        foreach ($groups as $group => $var) {
            $groupedPrices[] = ['label' => $group, 'y' =>
                100 * count(array_filter($prices, function ($a) use ($var, $group) {
                    return $group === 'not specified' ? $a['amount'] == 0 : $a['amount'] > $var[0] && $a['amount'] <= $var[1];
                })) / count($prices)];
        }

        return $groupedPrices;
    }

    private function render_php($path, array $data)
    {
        ob_start();
        include_once($_SERVER['DOCUMENT_ROOT'] . '/hunt_task/View/main.php');
        include_once($_SERVER['DOCUMENT_ROOT'] . '/hunt_task/View/header.php');
        include_once($path);
        include_once($_SERVER['DOCUMENT_ROOT'] . '/hunt_task/View/footer.php');
        $var = ob_get_contents();
        ob_end_clean();
        return $var;
    }

}